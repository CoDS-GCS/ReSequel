import sqlparse
from sqlparse.sql import IdentifierList, Identifier, Where, Comparison, Parenthesis, TokenList, Token, Function
from sqlparse.tokens import Whitespace, Literal, Number, String, Operator, Keyword, DML
import sqlglot
from sqlglot import exp
import re
from typing import List, Tuple, Dict, Any
import unicodedata
import difflib


class SQLTemplateManager:
    def __init__(self, templates=None, template_versions=None):
        if templates is None:
            self.templates = []
        else:
            self.templates = templates
        self.template_versions = template_versions

        # self.template_versions = dict()
        # for tv in template_versions.keys():
        #     self.template_versions[self.normalize_sql_string(tv)] = template_versions[tv]

        self.templates_IDS = dict()
        self.parameters = dict()

        self.OPERATOR_MAP = {
            "Eq": "=",
            "Neq": "<>",
            "Neq2": "<>",
            "Lt": "<",
            "Lte": "<=",
            "Gt": ">",
            "Gte": ">=",
            "Like": "like",
            "Ilike": "ilike",
            "Similarto": "similar to",
            "Notlike": "not like",
            "Notilike": "not ilike",
            "Notsimilarto": "not similar to",
            "Notin": "not in",
            "In": "in",
            "Contains": "@>",
            "Containedby": "<@",
            "Overlap": "&&",
            "Haskey": "?",
            "Hasanykeys": "?|",
            "Hasallkeys": "?&",
        }

        self.NEGATED_OPS = {
            "Like": "not like",
            "Ilike": "not ilike",
            "Similarto": "not similar to",
        }

    def evaluate_numeric_expressions(self, data):
        if re.fullmatch(r'[\d+\-*/(). ]+', data):
            try:
                # Evaluate safely with eval (only math expressions)
                result = eval(data, {"__builtins__": None}, {})
                evaluated_data = str(result)
            except Exception:
                evaluated_data = data
        else:
            evaluated_data = data
        return evaluated_data

    def normalize_sql_string(self, s):
        # Normalize unicode (e.g., normalize non-breaking space vs space)
        s = unicodedata.normalize("NFKC", s)
        # Replace non-breaking spaces and other invisible spaces with regular space
        s = s.replace('\u00A0', ' ').replace('\u200B', '')
        # Normalize line endings
        s = s.replace('\r\n', '\n').replace('\r', '\n')
        # Strip leading/trailing whitespace from each line
        lines = [line.strip() for line in s.strip().splitlines()]
        # Collapse multiple internal spaces to one
        lines = [re.sub(r'[ \t]+', ' ', line) for line in lines]
        return '\n'.join(lines)

    def normalize_sql(self, query: str) -> str:
        # Remove leading/trailing whitespace and collapse all whitespace to a single space
        normalized = re.sub(r'\s+', ' ', query.strip())
        return normalized

    def format_sql(self, query: str) -> str:
        formatted = sqlparse.format(
            query,
            reindent=True,
            keyword_case='upper'  # Options: 'upper', 'lower', 'capitalize'
        )
        return formatted

    def extract_key_value_pairs(self, query: str) -> Dict[str, List[Tuple[str, str | Tuple[str, ...]]]]:
        from util.Config import _dbms
        dialect = 'postgres'
        if _dbms.lower() == 'postgresql':
            dialect = 'postgres'
        elif _dbms.lower() == 'duckdb':
            dialect = 'duckdb'
        elif _dbms.lower() == 'mysql':
            dialect = 'mysql'

        query = query.replace("''", "''") #'"___EMPTY___"'
        return self.extract_parameters(query, dialect=dialect)

    def extract_cast_date(self, expr):
        if isinstance(expr, exp.Cast):
            if isinstance(expr.this, exp.Literal):
                return expr.this.name.strip("'")
        return None

    def extract_literal_value(self, expr):
        if expr is None:
            return None
        if isinstance(expr, exp.Literal):
            return expr.name.strip("'")
        if isinstance(expr, exp.Cast):
            return self.extract_cast_date(expr)
        if isinstance(expr, exp.Interval):
            return expr.this.name.strip("'")
        if isinstance(expr, exp.Paren):
            return tuple(self.extract_literal_value(e) for e in expr.expressions)
        if isinstance(expr, exp.Neg):
            # Handle negative values by extracting the inner literal and prepending a minus sign
            inner_value = self.extract_literal_value(expr.this)
            if inner_value is not None:
                return f"-{inner_value}" if isinstance(inner_value, str) else -inner_value
            return None
        # For arithmetic expressions, return the SQL string
        if isinstance(expr, (exp.Add, exp.Sub, exp.Mul, exp.Div)):
            return expr.sql()
        return None

    def get_operator(self, node):
        # Always use .capitalize() for the class name
        class_name = node.__class__.__name__.capitalize()
        return self.OPERATOR_MAP.get(class_name, class_name)

    def process_predicate_node(self, node, result):
        # Skip logical connectors
        if isinstance(node, (exp.And, exp.Or)):
            return
        # Handle NOT LIKE, NOT ILIKE, NOT SIMILAR TO
        if isinstance(node, exp.Not):
            child = node.this
            class_name = child.__class__.__name__
            if class_name in self.NEGATED_OPS:
                left = child.this.sql()
                right = self.extract_literal_value(child.expression)
                op = self.NEGATED_OPS[class_name]
                if left not in result:
                    result[left] = []
                result[left].append((op, right))
        # Handle LIKE, ILIKE, SIMILAR TO (not negated)
        elif isinstance(node, (exp.Like, exp.ILike, exp.SimilarTo)):
            parent = node.parent
            if not isinstance(parent, exp.Not):
                left = node.this.sql()
                right = self.extract_literal_value(node.expression)
                op = self.get_operator(node)
                if left not in result:
                    result[left] = []
                result[left].append((op, right))
        # Handle IN and NOT IN
        elif isinstance(node, exp.In):
            left = node.this.sql()
            values = [self.extract_literal_value(e) for e in node.expressions]
            op_in = "not in" if node.args.get("not") else "in"
            if left not in result:
                result[left] = []
            result[left].append((op_in, tuple(values)))
        # Handle BETWEEN and NOT BETWEEN
        elif isinstance(node, exp.Between):
            left = node.this.sql()
            low = self.extract_literal_value(node.args.get("low"))
            high = self.extract_literal_value(node.args.get("high"))
            op_between = "not between" if node.args.get("not") else "between"
            if left not in result:
                result[left] = []
            result[left].append((op_between, (low, high)))
        # Handle binary expressions
        elif isinstance(node, exp.Binary):
            op = self.get_operator(node)
            left = node.left.sql()
            right = node.right

            value = self.extract_literal_value(right)
            if value is not None:
                if isinstance(right, exp.Cast):
                    if left not in result:
                        result[left] = []
                    result[left].append((f"{op} date", value))
                else:
                    if left not in result:
                        result[left] = []
                    result[left].append((op, value))
            elif isinstance(right, exp.Add):
                date_val = None
                interval_val = None
                if isinstance(right.this, exp.Cast):
                    date_val = self.extract_cast_date(right.this)
                if isinstance(right.expression, exp.Interval):
                    interval_val = self.extract_literal_value(right.expression)
                if date_val is not None:
                    if left not in result:
                        result[left] = []
                    result[left].append((f"{op} date", date_val))
                if interval_val is not None:
                    if left not in result:
                        result[left] = []
                    result[left].append(("interval", interval_val))
        # Handle PostgreSQL/JSON/Array operators
        elif node.__class__.__name__ in self.OPERATOR_MAP:
            op = self.OPERATOR_MAP[node.__class__.__name__]
            left = node.this.sql()
            right = node.expression.sql() if hasattr(node, "expression") else None
            if left not in result:
                result[left] = []
            result[left].append((op, right))

    def extract_parameters(self, sql: str, dialect: str = "duckdb") -> Dict[str, List[Tuple[str, Any]]]:
        tree = sqlglot.parse_one(sql, read=dialect)
        result: Dict[str, List[Tuple[str, Any]]] = {}

        # Aggregations in SELECT
        for select_exp in tree.find_all(exp.Select):
            for projection in select_exp.expressions:
                if isinstance(projection, exp.Alias):
                    expr = projection.this
                else:
                    expr = projection
                if isinstance(expr, exp.AggFunc):
                    func_name = expr.key
                    arg_str = expr.sql()
                    masked = re.sub(r'\b\d+\b', '###', arg_str)
                    m = re.search(r'\b(\d+)\b', arg_str)
                    value = m.group(1) if m else None
                    if func_name not in result:
                        result[func_name] = []
                    result[func_name].append((masked, value))

        # WHERE clause: robust walk for all predicates
        for where in tree.find_all(exp.Where):
            for node in where.walk():
                self.process_predicate_node(node, result)

        # JOIN ON clause: robust walk for all predicates
        for join in tree.find_all(exp.Join):
            on_expr = join.args.get("on")
            if on_expr is not None:
                for node in on_expr.walk():
                    self.process_predicate_node(node, result)

        # LIMIT
        for limit in tree.find_all(exp.Limit):
            if limit.expression:
                if "limit" not in result:
                    result["limit"] = []
                result["limit"].append(("", limit.expression.sql()))

        return result

    def get_templates(self):
        return self.templates, self.templates_IDS, self.parameters

    def _simplify_in_clause(self, query: str) -> str:
        patterns = {"&&&": r"\(\s*(?:&&&\s*,\s*)*&&&\s*\)",
                    "###": r"\(\s*(?:###\s*,\s*)*###\s*\)",
                    "^^^": r"\(\s*(?:^^^\s*,\s*)*^^^\s*\)"}
        replace_tag = {"&&&": "N_SSS",
                        "###": "N_III",
                        "^^^": "N_DDD"}
        refined_query = query
        for pk in patterns.keys():
            if pk in refined_query:
               refined_query =  re.sub(patterns[pk], f"({replace_tag[pk]})", refined_query)

        return refined_query

    def extract_agg_expressions(self, sql: str):
        results = []
        i = 0
        n = len(sql)

        while i < n:
            match = re.match(r'\b(CAST|SUM|COUNT|MIN|MAX|AVG|SUBSTRING)\s*\(', sql[i:], re.IGNORECASE)
            if match:
                keyword = match.group(1).upper()
                start = i + match.start()
                open_parens = 0
                j = start + len(match.group(0)) - 1

                # Find the matching closing parenthesis
                while j < n:
                    if sql[j] == '(':
                        open_parens += 1
                    elif sql[j] == ')':
                        open_parens -= 1
                        if open_parens == 0:
                            break
                    j += 1

                if open_parens != 0:
                    i += 1
                    continue  # Skip unbalanced expression

                expr_end = j + 1  # position after closing parenthesis

                # Look ahead for "AS something" ignoring spaces
                as_match = re.match(r'\s*AS\s+[a-zA-Z_][a-zA-Z0-9_]*', sql[expr_end:], re.IGNORECASE)
                if as_match:
                    full_expr = sql[start:expr_end + as_match.end()]
                    results.append(full_expr.strip())
                    i = expr_end + as_match.end()
                else:
                    i += 1
            else:
                i += 1

        return results

    def extract_cast_patterns(self, sql: str):
        pattern = r"""(cast\s*\(\s*'([^']*)'\s+as\s+([a-zA-Z_][\w\s]*?(?:\([^)]*\))?)\s*\))"""
        matches = re.finditer(pattern, sql, flags=re.IGNORECASE)

        cast_pairs = dict()
        for match in matches:
            key = match.group(1)  # full matched string
            value = match.group(2)  # 'value'
            datatype = match.group(3)  # datatype
            cast_pairs[key] = (datatype, value)

        return cast_pairs

    def is_literal(self, value: str) -> bool:
        """Return True if the value is a string, number, or boolean literal."""
        value = value.strip().lower()
        return (
                re.fullmatch(r"'[^']*'", value) or  # string literal
                re.fullmatch(r"\d+(\.\d+)?", value) or  # integer or float
                value in {"true", "false"}
        )


    def extract_literal_comparisons(self, sql: str) -> List[Dict]:
        # Improved pattern to match full quoted strings or literals
        pattern = re.compile(r"""
            (?P<before>\b(?:AND|OR)\b)?         # optional AND/OR before
            \s*
            (?P<open_paren>\(?)                 # optional (
            \s*
            (?P<left>
                '(?:[^']*)'                     # quoted string literal (can have spaces)
                | \d+(?:\.\d+)?                 # number
                | true|false                    # boolean
            )
            \s*=\s*
            (?P<right>
                '(?:[^']*)'                     # quoted string
                | \d+(?:\.\d+)?                 # number
                | true|false
            )
            \s*
            (?P<close_paren>\)?)                # optional )
            \s*
            (?P<after>\b(?:AND|OR)\b)?          # optional AND/OR after
        """, re.IGNORECASE | re.VERBOSE)

        results = []
        for match in pattern.finditer(sql):
            left = match.group("left").strip()
            right = match.group("right").strip()

            if self.is_literal(left) and self.is_literal(right):
                left_val = left.strip("'").lower()
                right_val = right.strip("'").lower()
                results.append({
                    "full_match": match.group(0).strip(),
                    "left": left,
                    "right": right,
                    "is_equal": left_val == right_val,
                    "before_operator": (match.group("before") or "").upper(),
                    "after_operator": (match.group("after") or "").upper(),
                    "in_parentheses": bool(match.group("open_paren") or match.group("close_paren")),
                })

        return results

    def extract_agg_conditions(self, sql: str):
        results = []
        i = 0
        n = len(sql)
        start_pattern = re.compile(r'\b(CAST|SUM|COUNT|MIN|MAX|AVG|SUBSTRING)\s*\(', re.IGNORECASE)

        # Conditions that follow CAST/SUM(...), now includes IN (...)
        condition_pattern = re.compile(
            r'''
            \s*(=|!=|>=|<=|>|<)\s*           # Comparison operator + value
                (                             
                    (CAST\s*\([^\)]*\)\s*(AS\s+\w+)?)+|      # Possibly CAST on right side
                    '[^']*'|"[^"]*"|\d+(\.\d+)?              # Or literal value
                )
            |
            \s+IS\s+(NOT\s+)?NULL            # IS [NOT] NULL
            |
            \s+IN\s*\(.*?\)                  # IN clause
            ''',
            re.IGNORECASE | re.VERBOSE | re.DOTALL
        )

        while i < n:
            match = start_pattern.match(sql[i:])
            if match:
                start = i + match.start()
                j = start + len(match.group(0)) - 1

                # Track parens for CAST/SUM(...)
                open_parens = 0
                while j < n:
                    if sql[j] == '(':
                        open_parens += 1
                    elif sql[j] == ')':
                        open_parens -= 1
                        if open_parens == 0:
                            break
                    j += 1

                if open_parens != 0:
                    i += 1
                    continue

                expr_end = j + 1  # after closing ')'

                # Try to find a valid condition after this expression
                condition_match = condition_pattern.match(sql[expr_end:])
                if condition_match:
                    full_expr = sql[start:expr_end + condition_match.end()]
                    results.append(full_expr.strip())
                    i = expr_end + condition_match.end()
                else:
                    i = expr_end
            else:
                i += 1

        return results

    def _find_all_occurrences(self, large_string: str, substring: str) -> list[int]:
        positions = []
        index = large_string.find(substring)
        while index != -1:
            positions.append(index)
            index = large_string.find(substring, index + 1)
        return positions

    def _find_template_and_params(self, query: str, get_params: bool = True):
        tquery = query.replace("''", "''") #'"___EMPTY___"'
        tquery = self.normalize_sql(tquery)
        tquery = self.format_sql(tquery)
        agg_parts = dict()
        agg_expressions_parts_key = " ***AGG_EXPRESSIONS_PART_{}*** "
        agg_conditions_parts_key = " ***AGG_CONDITIONS_PART_{}*** "
        agg_expressions = self.extract_agg_expressions(tquery)
        agg_conditions = self.extract_agg_conditions(tquery)

        if len(agg_expressions) >= 0:
            for i, agg in enumerate(agg_expressions):
                key = f"{agg_expressions_parts_key.format(i)}"
                agg_parts[key] = agg
                tquery = tquery.replace(agg, key)

        if len(agg_conditions) >= 0:
            for i, agg in enumerate(agg_conditions):
                key = f"{agg_conditions_parts_key.format(i)}"
                agg_parts[key] = agg
                tquery = tquery.replace(agg, key)

        cast_parts = dict()
        cast_key_format = " ***CAST_PART_{}*** "
        if 'cast' in tquery.lower():
            cast_pairs = self.extract_cast_patterns(tquery)
            cast_index = 0
            if len(cast_pairs) > 0:
                for ck in cast_pairs.keys():
                    cast_key = cast_key_format.format(cast_index)
                    cast_parts[cast_key] = ck #cast_pairs[ck]
                    tquery = tquery.replace(ck, cast_key)
                    cast_index = cast_index + 1
        literal = self.extract_literal_comparisons(tquery)
        if len(literal) > 0:
            for l in literal:
                if l['is_equal']:
                    if l['before_operator'].lower() != l['after_operator'].lower():
                        if l['before_operator'].lower() == '':
                            if l['after_operator'].lower() == 'and':
                                tquery = tquery.replace(l['full_match'], '')
                            elif l['after_operator'].lower() == 'or':
                                tquery = tquery.replace(l['full_match'], 'true')

                        elif l['after_operator'].lower() == '':
                            if l['before_operator'].lower() == 'and':
                                tquery = tquery.replace(l['full_match'], '')
                            elif l['before_operator'].lower() == 'or':
                                tquery = tquery.replace(l['full_match'], 'true')

                        else:
                            # TODO: fix OR TRUE AND, AND TRUE OR
                            tquery = tquery.replace(l['full_match'], f"{l['before_operator']} true {l['after_operator']}")
                    else:
                        if l['before_operator'].lower() == 'and':
                            tquery = tquery.replace(l['full_match'], '')
                        elif l['before_operator'].lower() == '' and l['after_operator'].lower() == '':
                            tquery = tquery.replace(f"WHERE {l['full_match']}", '')
                        else:
                            tquery = tquery.replace(l['full_match'], 'true or')
        projection_parts = dict()
        projection_parts_key = " ***PROJECTION_PART_{}*** "
        select_poss = self._find_all_occurrences(large_string=tquery, substring="SELECT")
        from_poss = self._find_all_occurrences(large_string=tquery, substring="FROM")
        if len(select_poss) != len(from_poss):
            pass
        else:
            if len(select_poss) > 0:
                for i in range(0, len(select_poss)):
                    project_str = tquery[select_poss[i] + len('SELECT'): from_poss[i]]
                    projection_parts[project_str] = projection_parts_key.format(i)

                for pp in projection_parts.keys():
                    tquery = tquery.replace(pp, projection_parts[pp])
        # STRING_REGEX = r'([^\\])\'((\')|(.*?([^\\])\'))'
        STRING_REGEX = r"([^\\])'((?:[^']*(?:''[^']*)*)?)'"
        # DOUBLE_QUOTE_STRING_REGEX = r'([^\\])"((")|(.*?([^\\])"))'
        DOUBLE_QUOTE_STRING_REGEX = r'(?<![\w])(-?\d+\.\d+)(?![\w])'

        # INT_REGEX = r'([^a-zA-Z])-?\d+(\.\d+)?'  # To prevent us from capturing table name like "a1"
        INT_REGEX = r'(?<![\w])(-?\d+(?:\.\d+)?)(?![\w])'

        HASH_REGEX = r'(\'\d+\\.*?\')'

        template = re.sub(HASH_REGEX, r"@@@", tquery)
        template = re.sub(STRING_REGEX, r"\1&&&", template)
        template = re.sub(DOUBLE_QUOTE_STRING_REGEX, r"^^^", template)
        template = re.sub(INT_REGEX, r"###", template)
        template = self._simplify_in_clause(query=template)

        # Revert Masked Select and AGG.
        for sm in projection_parts.keys():
            template = template.replace(projection_parts[sm], sm)

        for ag in agg_parts.keys():
            template = template.replace(ag, agg_parts[ag])

        for ck in cast_parts.keys():
            template = template.replace(ck, cast_parts[ck])
        #
        if get_params:
            params = self.extract_key_value_pairs(query)
        else:
            params = None
        template = template.replace("### + ###", "###")
        template = template.replace("### + ### + ###", "###")
        template = template.replace("### + ### + ### + ###", "###")
        template = template.replace("### + ### + ### + ### + ###", "###")

        template = template.replace("###+###", "###")
        template = template.replace("###+###+###", "###")
        template = template.replace("###+###+###+###", "###")
        template = template.replace("### + ### + ### + ### + ###", "###")

        template = template.replace("^^^ + ^^^", "^^^")
        template = template.replace("^^^ + ^^^ + ^^^", "^^^")
        template = template.replace("^^^ + ^^^ + ^^^ + ^^^", "^^^")
        template = template.replace("^^^ + ^^^ + ^^^ + ^^^ + ^^^", "^^^")
        return template, params

    def find_or_add_template(self, query: str, qid: str, get_params: bool = True):
        template, params = self._find_template_and_params(query, get_params)
        if template in self.templates:
            template_index = self.templates.index(template)
        else:
            self.templates.append(template)
            template_index = len(self.templates) - 1

        idx_str = f"{template_index}"
        if idx_str in self.templates_IDS.keys():
            self.templates_IDS[idx_str].append(qid)
        else:
            self.templates_IDS[idx_str] = [qid]

        if get_params:
            self.parameters[qid] = params
        else:
            params = None
        return template_index, template, params

    def replace_param(self, template, pattern_parts, replacement, replace_count=1):
        escaped_parts = []
        for i, part in enumerate(pattern_parts):
            if i == 1:  # Make the second part case-insensitive
                escaped = re.escape(part)
                escaped_parts.append(f"(?i:{escaped})")
            else:
                escaped_parts.append(re.escape(part))
        # Allow arbitrary whitespace between parts
        pattern = r'\s*'.join(escaped_parts)

        # Compile regex with optional surrounding whitespace trimming
        regex = re.compile(pattern)

        # Replace the matched sequence with the replacement
        if replace_count == 1:
            new_template, count = regex.subn(replacement, template, count=1)
        else:
            new_template, count = regex.subn(replacement, template)
            if count > 1:
                count = 1
        return new_template, count

    def replace_params(self, column_name: str, operation: str, value: str, template: str, pattern_keys, table_alias:bool = True, neq_op= True, replace_count=1):
        new_query = template
        count = 0
        for inp in pattern_keys:
            pattern_parts = [column_name, operation, f"{inp}"]
            if inp == "'&&&%'":
                if value.endswith("%"):
                    tvalue = value
                else:
                    tvalue = f"'{value}%'"
            else:
                tvalue = value

            if (inp == "&&&" or inp == "'&&&%'"):
                if not tvalue.startswith("'") and not tvalue.endswith("'"):
                    tvalue = f"'{tvalue}'"
                elif not tvalue.startswith("'") and tvalue.endswith("'"):
                    tvalue = f"'{tvalue}"
                elif tvalue.startswith("'") and not tvalue.endswith("'"):
                    tvalue = f"{tvalue}'"


            replacement = f"{column_name} {operation.upper()} {tvalue}"
            # print(f"{replacement}   >>>  {pattern_parts}")
            new_query, count = self.replace_param(new_query, pattern_parts, replacement, replace_count)
            if count != 0:
                break

        if count == 0 and operation in {'!=', '<>'} and neq_op:
            if operation == '<>':
                return self.replace_params(column_name, '!=', value, template, pattern_keys,  True,False, replace_count)
            else:
                return self.replace_params(column_name, '<>', value, template, pattern_keys,True, False, replace_count)

        if count == 0 and table_alias and '.' in column_name:
            new_name = column_name.split(".")
            new_name = ".".join(new_name[1:])
            return self.replace_params(new_name, operation, value, template, pattern_keys, False, replace_count)

        return new_query, count

    def find_between_complex_pattern (self, value, base_mask):
        pattern = base_mask
        for op in {'-', '+', '*', '/'}:
            if value.find(op) > 0:
                pattern, _ = self._find_template_and_params(value, False)
                pattern = pattern.replace("0.###", "###")
                break
        return pattern

    def replace_between_params(self, column_name: str,  value_1, value_2, template: str, table_alias:bool = True):
        new_query = template
        for inp in ["###", '&&&', '^^^']:
            left_pattern = self.find_between_complex_pattern(value_1, inp)
            right_pattern = self.find_between_complex_pattern(value_2, inp)
            pattern_parts = [column_name, 'BETWEEN', f"{left_pattern}", "AND", f"{right_pattern}"]
            pattern_parts_parentheses = [column_name, 'BETWEEN', f"({left_pattern})", "AND", f"({right_pattern})"]
            pattern_parts_date = [column_name, 'BETWEEN', f"date {inp}", "AND", f"date {inp}"]
            pattern_parts_date_timestamp = [column_name, 'BETWEEN', f"{inp} :: timestamp", "AND", f"date {inp} :: timestamp"]

            tvalue_1 = value_1
            tvalue_2 = value_2
            if inp == "&&&":
                if not value_1.startswith("'") and not value_1.endswith("'"):
                    tvalue_1 = f"'{value_1}'"

                if not value_2.startswith("'") and not value_2.endswith("'"):
                    tvalue_2 = f"'{value_2}'"

            replacement_other = f"{column_name} BETWEEN {tvalue_1} AND {tvalue_2}"
            replacement_date = f"{column_name} BETWEEN date {tvalue_1} AND date {tvalue_2}"
            replacement_date_timestamp = f"{column_name} BETWEEN {tvalue_1} :: timestamp AND {tvalue_2} :: timestamp"
            for ppi, pp in enumerate([pattern_parts, pattern_parts_parentheses, pattern_parts_date, pattern_parts_date_timestamp]):
                replacement = replacement_other
                if ppi == 2:
                    replacement = replacement_date
                elif ppi == 3:
                    replacement = replacement_date_timestamp
                new_query, count = self.replace_param(new_query, pp, replacement)
                if count != 0:
                    break


        if count == 0 and table_alias and '.' in column_name:
            new_name = column_name.split(".")
            new_name = ".".join(new_name[1:])
            return self.replace_between_params(new_name, value_1, value_2, template, False)

        return new_query, count

    def replace_date_interval(self, column_name, operation, interval_value, interval_step, template: str, table_alias:bool = True):
        new_query = template
        count = 0
        for inp in ["###", '&&&', '^^^', "'###'"]:
            interval_bpos = template.find(f"interval {inp} {interval_step}")
            if interval_bpos == -1:
                continue
            sub_str = template[:interval_bpos].split(column_name)[-1].strip()
            pattern_parts = [column_name, sub_str,'interval', inp, interval_step]
            replacement = f"{column_name} {operation} {interval_value}"
            new_query, count = self.replace_param(new_query, pattern_parts, replacement)
            if count != 0:
                break

        if count == 0 and table_alias and '.' in column_name:
            new_name = column_name.split(".")
            new_name = ".".join(new_name[1:])
            return self.replace_date_interval(new_name, operation, interval_value, interval_step, template, False)

        return new_query, count

    def find_all_select_from_blocks(self, text):
        results = []
        text_lower = text.lower()
        pos = 0
        while pos < len(text):
            select_match = re.search(r'\bselect\b', text_lower[pos:])
            if not select_match:
                break
            select_start = pos + select_match.start()
            i = select_start + len('select')
            nesting = 0
            start = i
            while i < len(text):
                if text[i] == '(':
                    nesting += 1
                elif text[i] == ')':
                    nesting = max(nesting - 1, 0)
                elif nesting == 0:
                    # Check for top-level FROM
                    from_match = re.match(r'\bfrom\b', text_lower[i:])
                    if from_match:
                        results.append(text[start:i].strip())
                        pos = i + len('from')
                        break
                i += 1
            else:
                # No FROM found for this SELECT
                break

        return results

    def replace_select_to_from(self, template: str, query: str):
        if "&&&" not in template and "###" not in template and "^^^" not in template:
            return template
        tquery = query.replace("''", "''") #'"___EMPTY___"'
        tquery = self.normalize_sql(tquery)
        tquery = self.format_sql(tquery)

        template_list = []
        query_list = []

        for match in self.find_all_select_from_blocks(template):
            ms = match.strip()
            if ("&&&" in ms or "###" in ms or "^^^" in ms) and ('SELECT' not in ms and 'select' not in ms):
                template_list.append(ms)

        for match in self.find_all_select_from_blocks(tquery):
            ms = match.strip()
            if 'SELECT' not in ms and 'select' not in ms:
                query_list.append(ms)

        new_query = template
        if len(query_list) == 1 and len(template_list) == 1:
            new_query = template.replace(template_list[0], query_list[0])
            return new_query
        else:
            for qsf in query_list:
                mask_query, _ = self._find_template_and_params(qsf, False)
                mask_query = re.sub(' +', ' ', mask_query.replace("\n"," "))
                for tsf in template_list:
                    tsf_orig = tsf
                    tsf = re.sub(' +', ' ', tsf.replace("\n"," "))

                    if tsf == mask_query:
                        new_query = new_query.replace(tsf_orig, qsf)
                    elif len(tsf) > len(mask_query) and tsf.startswith(mask_query):
                        new_query = new_query.replace(tsf_orig, f"{qsf} {tsf[len(mask_query):]}")

        return new_query

    def replace_limit(self, template: str, limit_value: str):
        new_query = template.replace("LIMIT ###", f"LIMIT {limit_value}")
        return new_query

    def reconstruct_query(self, query: str):
        query_template, query_params = self._find_template_and_params(query, get_params=True)
        if query_params is None:
            return None, None
        if not query_template or query_template not in self.template_versions or not self.template_versions[query_template]:
            return None, None
        optimized_templates = self.template_versions[query_template]
        print(len(optimized_templates))

        # Replace parameters
        new_queries = []
        for template_version in optimized_templates:
            new_query = template_version
            for opk in query_params.keys():
              for opki in range(0, len(query_params[opk])):
                (query_operation_0, query_value_0) = query_params[opk][opki]
                if opk.lower() == 'limit':
                    for (_, limit_value) in query_params[opk]:
                        new_query = self.replace_limit(new_query, limit_value)

                elif query_operation_0.upper() == "IN" and isinstance(query_value_0, tuple):
                    str_pattern_count = new_query.count("N_SSS")
                    int_pattern_count = new_query.count("N_III")
                    double_pattern_count = new_query.count("N_DDD")
                    query_value_0_t = []
                    for v in query_value_0:
                        query_value_0_t.append(v.replace("'", "''"))
                    in_values = ', '.join(f"'{v}'" for v in query_value_0_t)

                    if str_pattern_count == 1:
                        new_query = new_query.replace("N_SSS", in_values)
                    if int_pattern_count == 1:
                        new_query = new_query.replace("N_III", in_values)
                    if double_pattern_count == 1:
                        new_query = new_query.replace("N_DDD", in_values)

                    if str_pattern_count > 1 or int_pattern_count > 1 or double_pattern_count > 1:
                        new_query, count = self.replace_params(column_name=opk, operation="IN", value=f"({in_values})",
                                                               template=new_query, pattern_keys=["(N_SSS)", "(N_III)", "(N_DDD)"], table_alias=True)
                        if count == 0:
                            # TODO: IN replaced with different operator
                            pass
                elif query_operation_0.lower() == 'between' and isinstance(query_value_0, tuple) and len(query_value_0) == 2:
                      new_query, count = self.replace_between_params(opk, query_value_0[0], query_value_0[1], new_query, True)

                else:
                    for i in range(len(query_params[opk])):
                        (query_operation, query_value) = query_params[opk][i]
                        if query_operation in ('=', '!=', '<>', '<', '>', '<=', '>=', 'like', 'ilike', 'not like', 'not ilike', '> date',
                                               '>= date', '<= date',  '< date'):
                            if 'INTERVAL' in query_value:
                               key_interval = query_value.split("INTERVAL")[-1].strip()
                               key_interval = key_interval.split(" ")[-1].strip()

                               new_query, count = self.replace_date_interval(column_name=opk, operation=query_operation, interval_value=query_value,
                                                          interval_step=key_interval, table_alias=False, template=new_query)
                               if count == 0 and 'date' in query_operation:
                                   new_query, count = self.replace_date_interval(column_name=opk,
                                                                                 operation=query_operation.replace(' date', '').replace('date', ''),
                                                                                 interval_value=query_value,
                                                                                 interval_step=key_interval,
                                                                                 table_alias=False, template=new_query)

                            else:
                                query_value = self.evaluate_numeric_expressions(query_value)
                                replace_count = 1
                                if len(query_params[opk]) == 1:
                                    replace_count = 100
                                new_query, count = self.replace_params(column_name=opk, operation=query_operation, value=query_value,
                                                                   template=new_query, pattern_keys=["&&&","'&&&%'", "###", "^^^"], table_alias=True, replace_count=replace_count)

                                if count == 0 and 'date' in query_operation:
                                    new_query, count = self.replace_params(column_name=opk,
                                                                           operation=query_operation.replace(' date', '').replace('date', ''),
                                                                           value=query_value,
                                                                           template=new_query,
                                                                           pattern_keys=["&&&", "'&&&%'", "###", "^^^"],
                                                                           table_alias=True)

            new_query = self.replace_select_to_from(template=new_query, query=query)
            if "&&&" not in new_query and "###" not in new_query and "^^^" not in new_query:
                #new_query = new_query.replace('"___EMPTY___"', "''")
                new_queries.append(new_query)
            else:
                pass

        return new_queries, query_template

    def extract_ordered_parameters(self, template: str) -> List[Tuple[str, str, str]]:
        parsed = sqlparse.parse(template)
        ordered_params = []
        for statement in parsed:
            for token in statement.tokens:
                if isinstance(token, Where):
                    self._extract_params_from_where(token, ordered_params)
                elif isinstance(token, Comparison):
                    self._extract_params_from_comparison(token, ordered_params)
                elif isinstance(token, IdentifierList):
                    for sub_token in token.flatten():
                        if isinstance(sub_token, Comparison):
                            self._extract_params_from_comparison(sub_token, ordered_params)
        return ordered_params

    def _extract_params_from_where(self, where: Where, ordered_params: list):
        for token in where.tokens:
            if isinstance(token, Comparison):
                self._extract_params_from_comparison(token, ordered_params)
            elif isinstance(token, IdentifierList):
                for sub_token in token.flatten():
                    if isinstance(sub_token, Comparison):
                        self._extract_params_from_comparison(sub_token, ordered_params)
            elif token.is_group:
                self._extract_params_from_where(token, ordered_params)

    def _extract_params_from_comparison(self, comparison: Comparison, ordered_params: list):
        tokens = [t for t in comparison.tokens if t.ttype != Whitespace and not t.is_whitespace]
        key = None
        op = None
        placeholder = None
        i = 0
        while i < len(tokens):
            token = tokens[i]
            if isinstance(token, Identifier):
                key = token.value.strip()
            elif token.ttype == Operator or token.value.upper() in ('LIKE', 'IN', 'BETWEEN'):
                op = token.value.lower()
                # Look ahead for placeholder
                j = i + 1
                while j < len(tokens):
                    next_token = tokens[j]
                    if next_token.value in ('&&&', '###', '^^^'):
                        placeholder = next_token.value
                        ordered_params.append((key, op, placeholder))
                        key = None
                        op = None
                        placeholder = None
                        i = j  # Skip ahead
                        break
                    elif next_token.is_group:
                        # Handle groups (parentheses) which might contain placeholders
                        group_tokens = next_token.tokens
                        for gt in group_tokens:
                            if gt.value in ('&&&', '###', '^^^'):
                                placeholder = gt.value
                                ordered_params.append((key, op, placeholder))
                        i = j
                        break
                    j += 1
            i += 1