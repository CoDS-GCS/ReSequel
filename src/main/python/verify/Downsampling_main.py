from sql_metadata import Parser
import subprocess
import psycopg2
from psycopg2 import sql
from typing import Dict, Set, List, Tuple
import random
from collections import defaultdict
from Database.Database import PostgreDB
import re
import sqlparse
import numpy as np
from collections import deque
import time



class Template_Info(object):
    def __init__(self, template: str):
        self.template = template
        self.tables, self.columns = self.get_template_tables_columns()

    def get_template_tables_columns(self):
        tables = []
        columns = []
        parser = Parser(self.template)
        tables.extend(parser.tables)
        #columns.extend(parser.columns)
        return set(tables), set(columns)

class Downsampling(object):
    def __init__(self, templates, catalog):
        self.templates = templates
        self.template_ID_SQL = dict()
        self.templates_info = self.get_templates_info()
        self.catalog = catalog


    def get_templates_info(self):
        templates_info = []
        for (template, template_id) in self.templates:
           tinfo = Template_Info(template)
           tables, columns = tinfo.get_template_tables_columns()
           template_info = {"template": template,"tables": tables, "columns": columns, "ID": template_id}
           templates_info.append(template_info)
           self.template_ID_SQL[template_id] = (template, tables, columns)
        return templates_info

    def get_similarity(self, a_tables, b_tables):
        a = a_tables
        b = b_tables
        if len(a_tables) > len(b_tables):
            a = b_tables
            b = a_tables

        diff = 0 #abs(len(template_a_tables) - len(template_b_tables))
        for table in a:
            if table not in b:
                diff = diff + 1
        all_tables = set(a)
        for table in b:
            all_tables.add(table)

        return  1 - (diff / len(all_tables)), all_tables

    def calc_similarities(self, cluster_items):
        similarity_pairs = dict()
        for i in range(0, len(cluster_items)):
            a_tables = cluster_items[i]['tables']
            for j in range(i+1, len(cluster_items)):
                b_tables = cluster_items[j]['tables']
                items = cluster_items[i]['items']
                items = items.union(cluster_items[j]['items'])
                similarity, all_tables = self.get_similarity(a_tables, b_tables)
                similarity_pairs[(i,j)] = (similarity,items, all_tables)

        return similarity_pairs

    def cluster_templates(self):
        cluster_items = []
        for i in range(0, len(self.templates_info)):
            items = {self.templates_info[i]["ID"]}
            cluster_items.append({"similarity": 0, "items":items , "tables": self.templates_info[i]["tables"]})

        similarity_pair = self.calc_similarities(cluster_items)
        merged_items = set()
        cluster_items = []

        for i in range(0, len(self.templates_info)):
            new_cluster_items = set()
            new_cluster_tables = set()
            for j in range(i+1, len(self.templates_info)):
                pair = (i,j)
                (similarity, items, all_tables) = similarity_pair[pair]
                if similarity == 1 and j not in merged_items:
                    if len(merged_items) == 0:
                        merged_items = {i,j}
                    else:
                        merged_items.add(i)
                        merged_items.add(j)

                    if len(new_cluster_items) == 0:
                        new_cluster_items = items
                        new_cluster_tables = all_tables
                    else:
                        new_cluster_items.union(items)
                        new_cluster_tables.union(all_tables)

            if len(new_cluster_items) > 0:
                cluster_items.append({"similarity": 1, "items":new_cluster_items , "tables": new_cluster_tables})

        # if cluster items is not empty:
        if len(cluster_items) > 0:
            for i in range(0, len(self.templates_info)):
                if i not in merged_items:
                    items = {self.templates_info[i]["ID"]}
                    cluster_items.append({"similarity": 0, "items":items , "tables": self.templates_info[i]["tables"]})
        return cluster_items

    def do_downsampling(self):
        from util.Config import _dataset_name
        clusters = self.cluster_templates()
        sample_index = 0
        for c in clusters:
            template_sql = []
            for t in c['items']:
                (template_text, template_tables, template_columns) = self.template_ID_SQL[t]
                if len(template_tables) > 1:
                    template_sql.append((template_text, template_tables, template_columns))

            # if sample_index == 0:
            sample_name = f"{_dataset_name}_sample_{sample_index}"
            sample = SampleDBPG(dest_db_name=sample_name, cluster_items=c, source_db_name=_dataset_name, cluster_templates= template_sql, catalog=self.catalog)
            sample.create_downsampled_database(central_table=None, sample_fraction=0.1)

            # sample.create_db_schema()
            sample_index += 1
            # break




class SampleDBPG(object):
    def __init__(self, cluster_items: dict , source_db_name: str, dest_db_name: str, cluster_templates: [], catalog):
        self.cluster_items = cluster_items
        self.source_db_name = source_db_name
        self.dest_db_name = dest_db_name
        self.cluster_templates = cluster_templates
        self.catalog = catalog

        self.cluster_tables = self.cluster_items['tables']
        self.source_conn, self.source_cursor = PostgreDB.connect()
        self.create_dest_db()
        self.dest_conn, self.dest_cursor = PostgreDB.connect_by_params(dataset_name=dest_db_name)

    def create_dest_db(self) -> str:
        from util.Config import _pgsql_user, _pgsql_password, _pgsql_host, _pgsql_port
        dest_db_params = {
            'dbname': f'{self.dest_db_name}',
            'user': f'{_pgsql_user}',
            'password': f'{_pgsql_password}',
            'host': f'{_pgsql_host}',
            'port': f'{_pgsql_port}'
        }
        try:
            # Create a fresh connection to the 'postgres' database
            admin_db_params = dest_db_params.copy()
            admin_db_params['dbname'] = 'postgres'
            admin_conn = psycopg2.connect(**admin_db_params)
            try:
                # Explicitly set autocommit to avoid transaction block
                admin_conn.set_session(autocommit=True)
                with admin_conn.cursor() as cursor:
                    # Drop the destination database if it exists
                    cursor.execute(sql.SQL("DROP DATABASE IF EXISTS {}").format(
                        sql.Identifier(self.dest_db_name)
                    ))
                    # Create the new destination database with UTF8 encoding
                    cursor.execute(sql.SQL("CREATE DATABASE {} ENCODING 'UTF8'").format(
                        sql.Identifier(self.dest_db_name)
                    ))
                return f"Successfully created destination database: {self.dest_db_name}"
            finally:
                admin_conn.close()  # Ensure the admin connection is closed
        except psycopg2.Error as e:
            return f"Error creating destination database: {str(e)}"
        except Exception as e:
            return f"Unexpected error creating destination database: {str(e)}"

    def get_table_schema(self, table_name: str) -> Tuple[str, List[str]]:
        """Retrieve table schema and primary key columns."""
        self.source_cursor.execute("""
                SELECT column_name, data_type, 
                       is_nullable, character_maximum_length, numeric_precision, numeric_scale
                FROM information_schema.columns
                WHERE table_schema = 'public' AND table_name = %s
            """, (table_name,))
        columns = self.source_cursor.fetchall()
        column_defs = []
        for col in columns:
                col_def = f"{col[0]} {col[1]}"
                if col[1] in ('character varying', 'character') and col[3]:
                    col_def += f"({col[3]})"
                elif col[1] in ('numeric', 'decimal') and col[4] and col[5]:
                    col_def += f"({col[4]},{col[5]})"
                if col[2] == 'NO':
                    col_def += " NOT NULL"
                column_defs.append(col_def)
        schema = ", ".join(column_defs)

        # Get primary key columns
        self.source_cursor.execute("""
                SELECT a.attname
                FROM pg_index i
                JOIN pg_attribute a ON a.attrelid = i.indrelid AND a.attnum = ANY(i.indkey)
                WHERE i.indrelid = %s::regclass AND i.indisprimary
            """, (table_name,))
        pk_columns = [row[0] for row in self.source_cursor.fetchall()]

        return schema, pk_columns

    def get_foreign_keys(self, table_name: str, table_subset: Set[str]) -> List[Dict]:
        """Retrieve foreign key relationships where the table is the referencing table, restricted to the subset."""
        self.source_cursor.execute("""
            SELECT
                tc.table_name AS from_table,
                kcu.column_name AS from_column,
                ccu.table_name AS to_table,
                ccu.column_name AS to_column,
                tc.constraint_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu
                ON tc.constraint_name = kcu.constraint_name
            JOIN information_schema.constraint_column_usage ccu
                ON ccu.constraint_name = tc.constraint_name
            WHERE tc.constraint_type = 'FOREIGN KEY' 
                AND tc.table_name = %s
                AND ccu.table_name IN %s
        """, (table_name, tuple(table_subset)))
        rows = self.source_cursor.fetchall()
        print(f"Raw FK query results for {table_name}: {rows}")  # Debug
        return [
            {
                'from_table': fk[0],
                'from_column': fk[1],
                'to_table': fk[2],
                'to_column': fk[3],
                'constraint_name': fk[4] if len(fk) > 4 else 'unknown'
            } for fk in rows
        ]

    def get_indexes(self, table_name: str) -> List[str]:
        """Retrieve index definitions for a table (excluding PK indexes)."""
        self.source_cursor.execute(f"""
                SELECT indexdef
                FROM pg_indexes
                WHERE schemaname = 'public' AND tablename = '{table_name}' 
                    AND indexname NOT LIKE '%_pkey'
            """)
        return [row[0] for row in self.source_cursor.fetchall()]

    def find_central_table(self, table_subset: List[str]) -> str:
        """Identify the central table in the subset based on FK dependencies."""
        dependency_count = defaultdict(int)
        for table in table_subset:
                # Count outgoing FKs (table references others)
            self.source_cursor.execute("""
                    SELECT ccu.table_name
                    FROM information_schema.table_constraints tc
                    JOIN information_schema.constraint_column_usage ccu
                        ON ccu.constraint_name = tc.constraint_name
                    WHERE tc.constraint_type = 'FOREIGN KEY'
                        AND tc.table_schema = 'public'
                        AND tc.table_name = %s
                        AND ccu.table_name IN %s
                """, (table, tuple(table_subset)))
            for row in self.source_cursor.fetchall():
                dependency_count[table] += 1  # Outgoing dependency

                # Count incoming FKs (others reference this table)
            self.source_cursor.execute("""
                    SELECT tc.table_name
                    FROM information_schema.table_constraints tc
                    JOIN information_schema.constraint_column_usage ccu
                        ON ccu.constraint_name = tc.constraint_name
                    WHERE tc.constraint_type = 'FOREIGN KEY'
                        AND tc.table_schema = 'public'
                        AND ccu.table_name = %s
                        AND tc.table_name IN %s
                """, (table, tuple(table_subset)))
            for row in self.source_cursor.fetchall():
                    dependency_count[table] += 1  # Incoming dependency

        if not dependency_count:
            return table_subset[0]  # Fallback to first table if no FKs
        return max(dependency_count, key=dependency_count.get)

    def discover_inclusion_dependencies(self, queries) -> List[Dict]:
        # Data structures
        nodes = []  # List of table-column pairs
        dependencies = []  # Store (node1, node2) edges

        for (query, tables, columns) in queries:
            print(f"Processing Query:")
            map_col_to_tables = dict()
            for table in tables:
                if table not in self.catalog.schema:
                    continue
                for col in self.catalog.schema[table]:
                    col_name = col["name"]
                    if col_name not in map_col_to_tables:
                        map_col_to_tables[col_name] = [table]
                    else:
                        map_col_to_tables[col_name].append(table)

            try:
                # Parse query
                parsed = sqlparse.parse(query)[0]

                # Extract join conditions from WHERE and JOIN clauses
                def extract_join_conditions(parsed):
                    conditions = []
                    def process_token_list(token_list):
                        i = 0
                        while i < len(token_list):
                            token = token_list[i]

                            # Look for comparison operators
                            if isinstance(token, sqlparse.sql.Comparison):
                                condition = token.value.strip()
                                if '=' in condition and '<>' not in condition and '!=' not in condition:
                                    conditions.append(condition.upper())

                            # Look for JOIN conditions
                            elif token.is_keyword and token.value.upper() == 'JOIN':
                                # Look ahead for ON clause
                                j = i + 1
                                while j < len(token_list):
                                    next_token = token_list[j]
                                    if (isinstance(next_token, sqlparse.sql.Token) and
                                            next_token.value.upper() == 'ON'):
                                        # Look for comparison after ON
                                        k = j + 1
                                        while k < len(token_list):
                                            on_token = token_list[k]
                                            if isinstance(on_token, sqlparse.sql.Comparison):
                                                condition = on_token.value.strip()
                                                if '=' in condition and '<>' not in condition and '!=' not in condition:
                                                    conditions.append(condition.upper())
                                                break
                                            k += 1
                                        break
                                    j += 1

                            # Process nested tokens
                            if hasattr(token, 'tokens'):
                                process_token_list(token.tokens)

                            i += 1

                    process_token_list(parsed.tokens)
                    return conditions

                conditions = extract_join_conditions(parsed)
                for condition in conditions:
                    condition_parts = condition.lower().split('=')
                    if len(condition_parts) == 2:
                        left_part = condition_parts[0].strip()
                        right_part = condition_parts[1].strip()

                        left_part = left_part.split(".")
                        right_part = right_part.split(".")
                        if len(left_part) == 1:
                            left_part = left_part[0]
                        else:
                            left_part = left_part[1]

                        if len(right_part) == 1:
                            right_part = right_part[0]
                        else:
                            right_part = right_part[1]

            except Exception as e:
                print(f"  Error processing query: {e}")
                import traceback
                traceback.print_exc()
                continue

        # # Create unique list of nodes
        # nodes = sorted(list(set(nodes)))
        # print(f"\nAll Nodes: {nodes}")
        #
        # # Extract unique dependencies
        # unique_dependencies = []
        # seen = set()
        #
        # for node1, node2 in dependencies:
        #     if node1 != node2:  # Skip self-loops
        #         table1, col1 = node1.split('.')
        #         table2, col2 = node2.split('.')
        #
        #         # Create normalized dependency tuple
        #         dep_tuple = (table1, col1, table2, col2)
        #         reverse_dep_tuple = (table2, col2, table1, col1)
        #
        #         # Add dependency only once (undirected)
        #         if dep_tuple not in seen and reverse_dep_tuple not in seen:
        #             seen.add(dep_tuple)
        #             seen.add(reverse_dep_tuple)
        #             unique_dependencies.append({
        #                 "source_table": table1,
        #                 "source_column": col1,
        #                 "dest_table": table2,
        #                 "dest_column": col2
        #             })
        #
        # # Output results
        # print("\nDependencies:")
        # print("Source Table | Source Column | Destination Table | Destination Column")
        # print("-" * 60)
        # for dep in unique_dependencies:
        #     print(
        #         f"{dep['source_table']:12} | {dep['source_column']:13} | {dep['dest_table']:17} | {dep['dest_column']}")
        #
        # return unique_dependencies
        return []


    def discover_inclusion_dependencies_regex(self, queries) -> List[Dict]:
        """Discover inclusion dependencies among tables in the subset."""
        # Data structures
        alias_map = {}  # Maps alias to table (e.g., 'l1': 'LINEITEM')
        nodes = []  # List of table-column pairs (e.g., 'SUPPLIER.S_SUPPKEY')
        dependencies = []  # Store (node1, node2) edges

        for query_idx, query in enumerate(queries, 1):
            print(f"\nProcessing Query {query_idx}:")
            # Parse query
            parsed = sqlparse.parse(query)[0]

            # Extract tables and aliases from FROM clause
            alias_map.clear()  # Reset for each query

            def extract_tables(token_list, alias_map, in_from=False):
                for token in token_list:
                    # Set in_from flag when FROM is encountered
                    if isinstance(token, sqlparse.sql.Token) and token.value.upper() == 'FROM':
                        in_from = True
                        continue
                    # Process IdentifierList (e.g., "supplier, lineitem l1, orders, nation")
                    if in_from and isinstance(token, sqlparse.sql.IdentifierList):
                        for identifier in token.get_identifiers():
                            name = identifier.get_real_name()
                            alias = identifier.get_alias()
                            if name:  # Ensure it's a valid table name
                                alias_map[alias or name] = name
                    # Process single Identifier (e.g., "lineitem" in Query 2)
                    elif in_from and isinstance(token, sqlparse.sql.Identifier):
                        name = token.get_real_name()
                        alias = token.get_alias()
                        if name:
                            alias_map[alias or name] = name
                    # Handle subqueries
                    if isinstance(token, sqlparse.sql.Parenthesis) and token.value.upper().startswith('(SELECT'):
                        subparsed = sqlparse.parse(token.value)[0]
                        extract_tables(subparsed.tokens, alias_map, False)
                    # Continue processing sub-tokens
                    if token.is_group:
                        extract_tables(token.tokens, alias_map, in_from)

            extract_tables(parsed.tokens, alias_map)
            print(f"  Aliases: {alias_map}")

            # Extract join conditions from WHERE clause
            def extract_conditions(token_list, conditions):
                for token in token_list:
                    if isinstance(token, sqlparse.sql.Where):
                        for subtoken in token.tokens:
                            if isinstance(subtoken, sqlparse.sql.Comparison):
                                condition = str(subtoken).strip().upper()
                                if '=' in condition and '<>' not in condition:  # Only equality conditions
                                    conditions.append(condition)
                    if token.is_group:
                        extract_conditions(token.tokens, conditions)

            conditions = []
            extract_conditions(parsed.tokens, conditions)
            print(f"  Conditions: {conditions}")

            # Process conditions
            query_nodes = set()
            query_edges = []
            for condition in conditions:
                left, right = condition.split('=', 1)  # Split on first '='
                left = left.strip()
                right = right.strip()
                if '.' in left and '.' in right:
                    alias1, col1 = left.rsplit('.', 1)
                    alias2, col2 = right.rsplit('.', 1)
                    if alias1 in alias_map and alias2 in alias_map:
                        table1 = alias_map[alias1]
                        table2 = alias_map[alias2]
                        if table1 != table2:  # Skip intra-table dependencies
                            node1 = f"{table1}.{col1}"
                            node2 = f"{table2}.{col2}"
                            query_nodes.add(node1)
                            query_nodes.add(node2)
                            query_edges.append((node1, node2))
            print(f"  Nodes: {query_nodes}")
            print(f"  Edges: {query_edges}")

            # Add to global nodes and dependencies
            nodes.extend(query_nodes)
            dependencies.extend(query_edges)

        # Create unique list of nodes
        nodes = sorted(list(set(nodes)))
        print(f"\nAll Nodes: {nodes}")

        # Build adjacency matrix
        n = len(nodes)
        adj_matrix = np.zeros((n, n), dtype=int) if n > 0 else np.array([])
        for node1, node2 in dependencies:
            i = nodes.index(node1)
            j = nodes.index(node2)
            adj_matrix[i, j] = 1
            adj_matrix[j, i] = 1  # Undirected graph

        print("\nAdjacency Matrix:")
        print(adj_matrix)

        # Extract dependencies from adjacency matrix
        unique_dependencies = []
        seen = set()
        for i in range(n):
            for j in range(i + 1, n):  # Avoid duplicates and self-loops
                if adj_matrix[i, j] == 1:
                    table1, col1 = nodes[i].split('.')
                    table2, col2 = nodes[j].split('.')
                    dep_tuple = (table1, col1, table2, col2)
                    if dep_tuple not in seen:
                        seen.add(dep_tuple)
                        unique_dependencies.append({
                            "source_table": table1,
                            "source_column": col1,
                            "dest_table": table2,
                            "dest_column": col2
                        })

        # Output results
        print("\nDependencies:")
        print("Source Table | Source Column | Destination Table | Destination Column")
        print("-" * 60)
        for dep in unique_dependencies:
            print(f"{dep['source_table']} | {dep['source_column']} | {dep['dest_table']} | {dep['dest_column']}")

        return unique_dependencies

    def downsample_table(
            self,
            table_name: str,
            sample_fraction: float,
            sampled_ids: Dict[str, Set],
            sampled_id_columns: Dict[str, str],
            visited_tables: Set[str],
            table_subset: Set[str],
            semantic_relations: List[Dict] = None
    ) -> None:
        """Downsample a table and propagate to related tables (via FKs, INDs, and semantic relationships)."""
        if table_name in visited_tables or table_name not in table_subset:
            print(f"Skipping {table_name}: already visited or not in subset")  # Debug
            return

        visited_tables.add(table_name)
        print(f"Processing table: {table_name}")  # Debug: Log table being processed
        # Get primary key
        _, pk_columns = self.get_table_schema(table_name)
        pk_column = pk_columns[0] if pk_columns else None

        # Get foreign keys for this table (outgoing FKs)
        fks = self.get_foreign_keys(table_name, table_subset)
        fk_strings = []
        for fk in fks:
            try:
                fk_strings.append(f"{fk['from_table']}.{fk['from_column']} -> {fk['to_table']}.{fk['to_column']}")
            except KeyError as e:
                print(f"Error in FK for {table_name}: Missing key {e} in {fk}")  # Debug
        print(f"Outgoing FKs for {table_name}: {fk_strings}")  # Debug

        # Discover inclusion dependencies if not provided in semantic_relations
        if semantic_relations is None:
            semantic_relations = self.discover_inclusion_dependencies(self.cluster_templates)
            # for r in semantic_relations:
            #     print(f"Semantic relations (including INDs): {r['from_table']}.{r['from_column']} -> {r['to_table']}.{r['to_column']}'") # Debug

        # print(
        #     f"Semantic relations (including INDs): {[f'{r['from_table']}.{r['from_column']} -> {r['to_table']}.{r['to_column']}' for r in semantic_relations]}")  # Debug

        # Sample rows from the table
        if table_name not in sampled_ids:
            if pk_column:
                # Use PK for sampling
                self.source_cursor.execute(sql.SQL("SELECT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                    sql.Identifier(pk_column),
                    sql.Identifier(table_name),
                    sql.Placeholder()
                ), (sample_fraction * 100,))
                sampled_ids[table_name] = set(row[0] for row in self.source_cursor.fetchall())
                sampled_id_columns[table_name] = pk_column  # Track PK column
                print(f"Sampled {table_name} using PK {pk_column}: {len(sampled_ids[table_name])} IDs")  # Debug
            elif fks:
                # Use the FK's from_column for sampling if the table has outgoing FKs
                from_column = fks[0]['from_column']
                self.source_cursor.execute(sql.SQL("SELECT DISTINCT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                    sql.Identifier(from_column),
                    sql.Identifier(table_name),
                    sql.Placeholder()
                ), (sample_fraction * 100,))
                sampled_ids[table_name] = set(row[0] for row in self.source_cursor.fetchall())
                sampled_id_columns[table_name] = from_column  # Track FK from_column
                print(f"Sampled {table_name} using FK {from_column}: {len(sampled_ids[table_name])} IDs")  # Debug
            else:
                # Check if this table is referenced by any FKs or semantic relations
                self.source_cursor.execute("""
                    SELECT
                        tc.table_name AS from_table,
                        kcu.column_name AS from_column,
                        ccu.table_name AS to_table,
                        ccu.column_name AS to_column
                    FROM information_schema.table_constraints tc
                    JOIN information_schema.key_column_usage kcu
                        ON tc.constraint_name = kcu.constraint_name
                    JOIN information_schema.constraint_column_usage ccu
                        ON ccu.constraint_name = tc.constraint_name
                    WHERE tc.constraint_type = 'FOREIGN KEY' 
                        AND ccu.table_name = %s
                        AND tc.table_name IN %s
                """, (table_name, tuple(table_subset)))
                referenced_by = [
                    {'from_table': row[0], 'from_column': row[1], 'to_table': row[2], 'to_column': row[3]}
                    for row in self.source_cursor.fetchall()
                ]
                # print(
                #     f"Tables referencing {table_name} via FK: {[f'{r['from_table']}.{r['from_column']} -> {r['to_table']}.{r['to_column']}' for r in referenced_by]}")  # Debug
                semantic_refs = [r for r in semantic_relations if
                                 r['to_table'] == table_name and r['from_table'] in table_subset]
                # print(
                #     f"Tables referencing {table_name} via semantic relations: {[f'{r['from_table']}.{r['from_column']} -> {r['to_table']}.{r['to_column']}' for r in semantic_refs]}")  # Debug
                if referenced_by:
                    to_column = referenced_by[0]['to_column']
                    self.source_cursor.execute(sql.SQL("SELECT DISTINCT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                        sql.Identifier(to_column),
                        sql.Identifier(table_name),
                        sql.Placeholder()
                    ), (sample_fraction * 100,))
                    sampled_ids[table_name] = set(row[0] for row in self.source_cursor.fetchall())
                    sampled_id_columns[table_name] = to_column  # Track FK to_column
                    print(
                        f"Sampled {table_name} using FK to_column {to_column}: {len(sampled_ids[table_name])} IDs")  # Debug
                elif semantic_refs:
                    to_column = semantic_refs[0]['to_column']
                    self.source_cursor.execute(sql.SQL("SELECT DISTINCT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                        sql.Identifier(to_column),
                        sql.Identifier(table_name),
                        sql.Placeholder()
                    ), (sample_fraction * 100,))
                    sampled_ids[table_name] = set(row[0] for row in self.source_cursor.fetchall())
                    sampled_id_columns[table_name] = to_column  # Track semantic to_column
                    print(
                        f"Sampled {table_name} using semantic to_column {to_column}: {len(sampled_ids[table_name])} IDs")  # Debug
                else:
                    self.source_cursor.execute(sql.SQL("SELECT ctid FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                        sql.Identifier(table_name),
                        sql.Placeholder()
                    ), (sample_fraction * 100,))
                    sampled_ids[table_name] = set(row[0] for row in self.source_cursor.fetchall())
                    sampled_id_columns[table_name] = 'ctid'  # Track ctid
                    print(f"Sampled {table_name} using ctid: {len(sampled_ids[table_name])} IDs")  # Debug

        # Propagate to parent tables (tables this table references via FKs)
        for fk in fks:
            if fk['to_table'] in table_subset:  # Always propagate to parent tables in subset
                if not sampled_ids[table_name]:  # Skip if no sampled IDs
                    continue
                placeholders = ','.join(['%s'] * len(sampled_ids[table_name]))
                identifier = sampled_id_columns[table_name]  # Use the column used for sampling
                print(
                    f"Parent propagation: {table_name}.{fk['from_column']} -> {fk['to_table']}.{fk['to_column']}")  # Debug
                self.source_cursor.execute(sql.SQL("""
                    SELECT DISTINCT {} 
                    FROM {} 
                    WHERE {} IN (
                        SELECT DISTINCT {} FROM {} WHERE {} IN ({})
                    )
                """).format(
                    sql.Identifier(fk['to_column']),
                    sql.Identifier(fk['to_table']),
                    sql.Identifier(fk['to_column']),
                    sql.Identifier(fk['from_column']),
                    sql.Identifier(fk['from_table']),
                    sql.Identifier(identifier),
                    sql.SQL(placeholders)
                ), list(sampled_ids[table_name]))
                related_ids = set(row[0] for row in self.source_cursor.fetchall())
                print(f"Sampled IDs for {fk['to_table']}: {len(related_ids)} IDs")  # Debug
                if related_ids:  # Only update and recurse if there are new IDs
                    sampled_ids[fk['to_table']] = sampled_ids.get(fk['to_table'], set()).union(
                        related_ids)  # Merge new IDs
                    sampled_id_columns[fk['to_table']] = fk['to_column']  # Track to_column for parent table
                    self.downsample_table(fk['to_table'], sample_fraction, sampled_ids, sampled_id_columns,
                                          visited_tables, table_subset, semantic_relations)

        # Propagate to child tables (tables referencing this table via FKs)
        self.source_cursor.execute("""
            SELECT
                tc.table_name AS from_table,
                kcu.column_name AS from_column,
                ccu.table_name AS to_table,
                ccu.column_name AS to_column,
                tc.constraint_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu
                ON tc.constraint_name = kcu.constraint_name
            JOIN information_schema.constraint_column_usage ccu
                ON ccu.constraint_name = tc.constraint_name
            WHERE tc.constraint_type = 'FOREIGN KEY' 
                AND ccu.table_name = %s
                AND tc.table_name IN %s
        """, (table_name, tuple(table_subset)))
        child_fks = [
            {
                'from_table': fk[0],
                'from_column': fk[1],
                'to_table': fk[2],
                'to_column': fk[3],
                'constraint_name': fk[4] if len(fk) > 4 else 'unknown'
            } for fk in self.source_cursor.fetchall()
        ]
        # print(
        #     f"Child FKs for {table_name}: {[f'{fk['from_table']}.{fk['from_column']} -> {fk['to_table']}.{fk['to_column']}' for fk in child_fks]}")  # Debug
        for fk in child_fks:
            t = fk['from_table']
            if t in visited_tables:
                print(f"Skipping child {t}: already visited")  # Debug
                continue
            if not sampled_ids[table_name]:
                print(f"Skipping child {t}: no sampled IDs for {table_name}")  # Debug
                continue
            placeholders = ','.join(['%s'] * len(sampled_ids[table_name]))
            _, child_pk_columns = self.get_table_schema(t)
            child_identifier = child_pk_columns[0] if child_pk_columns else 'ctid'
            identifier = sampled_id_columns[table_name]  # Use the column used for sampling
            print(f"Child propagation: {table_name} <- {t} ({fk['to_column']} <- {fk['from_column']})")  # Debug
            if identifier == 'ctid' or identifier != fk['to_column']:
                self.source_cursor.execute(sql.SQL("""
                    SELECT DISTINCT {} 
                    FROM {} 
                    WHERE {} IN (
                        SELECT {} FROM {} WHERE {} IN ({})
                    )
                """).format(
                    sql.Identifier(child_identifier),
                    sql.Identifier(t),
                    sql.Identifier(fk['from_column']),
                    sql.Identifier(fk['to_column']),
                    sql.Identifier(table_name),
                    sql.Identifier(identifier),
                    sql.SQL(placeholders)
                ), list(sampled_ids[table_name]))
            else:
                self.source_cursor.execute(sql.SQL("""
                    SELECT DISTINCT {} 
                    FROM {} 
                    WHERE {} IN ({})
                """).format(
                    sql.Identifier(child_identifier),
                    sql.Identifier(t),
                    sql.Identifier(fk['from_column']),
                    sql.SQL(placeholders)
                ), list(sampled_ids[table_name]))
            related_ids = set(row[0] for row in self.source_cursor.fetchall())
            print(f"Sampled IDs for {t}: {len(related_ids)} IDs")  # Debug
            if not related_ids and t in table_subset:
                print(
                    f"No matching rows for {t} via FK {fk['from_column']} -> {fk['to_table']}.{fk['to_column']}, sampling directly")  # Debug
                _, child_pk_columns = self.get_table_schema(t)
                child_identifier = child_pk_columns[0] if child_pk_columns else 'ctid'
                self.source_cursor.execute(sql.SQL("SELECT DISTINCT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                    sql.Identifier(child_identifier),
                    sql.Identifier(t),
                    sql.Placeholder()
                ), (sample_fraction * 100,))
                related_ids = set(row[0] for row in self.source_cursor.fetchall())
                print(f"Directly sampled {t} using {child_identifier}: {len(related_ids)} IDs")  # Debug
            if related_ids:
                sampled_ids[t] = related_ids
                sampled_id_columns[t] = child_identifier
                self.downsample_table(t, sample_fraction, sampled_ids, sampled_id_columns, visited_tables, table_subset,
                                      semantic_relations)

        # Propagate to semantically related tables (including INDs)
        for rel in semantic_relations:
            from_table = rel.get('from_table')
            from_column = rel.get('from_column')
            to_table = rel.get('to_table')
            to_column = rel.get('to_column')
            if to_table == table_name and from_table in table_subset and from_table not in visited_tables:
                if not sampled_ids[table_name]:
                    print(f"Skipping semantic child {from_table}: no sampled IDs for {table_name}")  # Debug
                    continue
                placeholders = ','.join(['%s'] * len(sampled_ids[table_name]))
                _, child_pk_columns = self.get_table_schema(from_table)
                child_identifier = child_pk_columns[0] if child_pk_columns else 'ctid'
                identifier = sampled_id_columns[table_name]
                print(f"Semantic/IND propagation: {table_name} <- {from_table} ({to_column} <- {from_column})")  # Debug
                if identifier == 'ctid' or identifier != to_column:
                    self.source_cursor.execute(sql.SQL("""
                        SELECT DISTINCT {} 
                        FROM {} 
                        WHERE {} IN (
                            SELECT {} FROM {} WHERE {} IN ({})
                        )
                    """).format(
                        sql.Identifier(child_identifier),
                        sql.Identifier(from_table),
                        sql.Identifier(from_column),
                        sql.Identifier(to_column),
                        sql.Identifier(table_name),
                        sql.Identifier(identifier),
                        sql.SQL(placeholders)
                    ), list(sampled_ids[table_name]))
                else:
                    self.source_cursor.execute(sql.SQL("""
                        SELECT DISTINCT {} 
                        FROM {} 
                        WHERE {} IN ({})
                    """).format(
                        sql.Identifier(child_identifier),
                        sql.Identifier(from_table),
                        sql.Identifier(from_column),
                        sql.SQL(placeholders)
                    ), list(sampled_ids[table_name]))
                related_ids = set(row[0] for row in self.source_cursor.fetchall())
                print(f"Sampled IDs for {from_table} (semantic/IND): {len(related_ids)} IDs")  # Debug
                if not related_ids and from_table in table_subset:
                    print(
                        f"No matching rows for {from_table} via semantic/IND {from_column} -> {to_table}.{to_column}, sampling directly")  # Debug
                    _, child_pk_columns = self.get_table_schema(from_table)
                    child_identifier = child_pk_columns[0] if child_pk_columns else 'ctid'
                    self.source_cursor.execute(sql.SQL("SELECT DISTINCT {} FROM {} TABLESAMPLE BERNOULLI (%s)").format(
                        sql.Identifier(child_identifier),
                        sql.Identifier(from_table),
                        sql.Placeholder()
                    ), (sample_fraction * 100,))
                    related_ids = set(row[0] for row in self.source_cursor.fetchall())
                    print(f"Directly sampled {from_table} using {child_identifier}: {len(related_ids)} IDs")  # Debug
                if related_ids:
                    sampled_ids[from_table] = related_ids
                    sampled_id_columns[from_table] = child_identifier
                    self.downsample_table(from_table, sample_fraction, sampled_ids, sampled_id_columns, visited_tables,
                                          table_subset, semantic_relations)
    def copy_table_data(
            self,
            table_name: str,
            sampled_ids: Dict[str, Set]
    ) -> None:
        """Copy sampled data to the destination database, handling tables without PKs."""
        _, pk_columns = self.get_table_schema(table_name)
        pk_column = pk_columns[0] if pk_columns else None

        if table_name not in sampled_ids or not sampled_ids[table_name]:
            return

        # Check if this table is referenced to determine the identifier
        identifier_column = pk_column
        if not pk_column:
                # Find if table is referenced by any FK in the subset
                table_subset = set(sampled_ids.keys())
                for t in table_subset:
                    if t == table_name:
                        continue
                    fks = self.get_foreign_keys(t, table_subset)
                    for fk in fks:
                        if fk['to_table'] == table_name:
                            identifier_column = fk['to_column']
                            break
                    if identifier_column:
                        break
                if not identifier_column:
                    identifier_column = 'ctid'

        # Fetch sampled rows
        placeholders = ','.join(['%s'] * len(sampled_ids[table_name]))
        self.source_cursor.execute(sql.SQL("SELECT * FROM {} WHERE {} IN ({})").format(
                sql.Identifier(table_name),
                sql.Identifier(identifier_column),
                sql.SQL(placeholders)
            ), list(sampled_ids[table_name]))
        rows = self.source_cursor.fetchall()

        # Get column names
        self.source_cursor.execute("""
                SELECT column_name
                FROM information_schema.columns
                WHERE table_schema = 'public' AND table_name = %s
            """, (table_name,))
        columns = [row[0] for row in self.source_cursor.fetchall()]
        if not columns:
            return
        col_identifiers = sql.SQL(',').join(map(sql.Identifier, columns))
        placeholders = sql.SQL(',').join(sql.Placeholder() * len(columns))

        # Insert into destination database
        for row in rows:
                self.dest_cursor.execute(sql.SQL("INSERT INTO {} ({}) VALUES ({})").format(
                    sql.Identifier(table_name),
                    col_identifiers,
                    placeholders
                ), row)
        self.dest_conn.commit()

    def create_downsampled_database(
            self,
            central_table: str = None,
            sample_fraction: float = 0.1
    ) -> None:
        table_subset_set = set(self.cluster_tables)
        semantic_relations = self.discover_inclusion_dependencies(self.cluster_templates)

        # for r in semantic_relations:
        #     print(f"Semantic relations (including INDs): {r['from_table']}.{r['from_column']} -> {r['to_table']}.{r['to_column']}'")

    def create_downsampled_database_1(
            self,
            central_table: str = None,
            sample_fraction: float = 0.1
    ) -> None:
        table_subset = [t for t in self.cluster_tables]
        table_subset_set = set(self.cluster_tables)

        # Identify central table if not provided
        if not central_table:
            central_table = self.find_central_table(table_subset)
            print(f"Identified central table: {central_table}")

        # Validate central table
        if central_table not in table_subset:
            raise ValueError(f"Central table '{central_table}' not in table subset {table_subset}")

        # Copy schema for subset of tables
        for table in table_subset:
            schema, pk_columns = self.get_table_schema(table)
            create_table_stmt = sql.SQL("CREATE TABLE {} ({})").format(
                sql.Identifier(table),
                sql.SQL(schema)
            )
            self.dest_cursor.execute(create_table_stmt)

        # Add primary key constraints
        for table in table_subset:
            _, pk_columns = self.get_table_schema(table)
            if pk_columns:
                pk_constraint = sql.SQL("ALTER TABLE {} ADD PRIMARY KEY ({})").format(
                    sql.Identifier(table),
                    sql.SQL(',').join(map(sql.Identifier, pk_columns))
                )
                self.dest_cursor.execute(pk_constraint)
        self.dest_conn.commit()

        # Initialize sampled IDs and visited tables
        sampled_ids: Dict[str, Set] = {}
        sampled_id_columns: Dict[str, str] = {}
        visited_tables: Set[str] = set()

        # Downsample starting from the central table
        print(table_subset_set)
        self.downsample_table(central_table, sample_fraction, sampled_ids, sampled_id_columns, visited_tables,
                              table_subset_set)

        # Copy sampled data to destination database
        print(self.cluster_tables)
        for table in sampled_ids:
            print(f"{table}: {len(sampled_ids[table])}")
            self.copy_table_data(table, sampled_ids)

        # Add foreign key constraints within subset after data insertion
        for table in table_subset:
            fks = self.get_foreign_keys(table, table_subset_set)
            for fk in fks:
                fk_constraint = sql.SQL(
                    "ALTER TABLE {} ADD CONSTRAINT {} FOREIGN KEY ({}) REFERENCES {} ({})").format(
                    sql.Identifier(fk['from_table']),
                    sql.Identifier(fk['constraint_name']),
                    sql.Identifier(fk['from_column']),
                    sql.Identifier(fk['to_table']),
                    sql.Identifier(fk['to_column'])
                )
                self.dest_cursor.execute(fk_constraint)

        # Add indexes (excluding PK indexes)
        for table in table_subset:
            indexes = self.get_indexes(table)
            for index_def in indexes:
                self.dest_cursor.execute(index_def)

        self.dest_conn.commit()

        # Close connections
        self.source_conn.close()
        self.dest_conn.close()