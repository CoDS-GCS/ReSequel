from Database.Database import PostgreDB
import math
import re
import json
import threading
import multiprocessing
import queue


class CatalogInfo(object):
    def __init__(self,
                 dataset_name: str,
                 number_of_tables: int,
                 table_names: [],
                 table_indexes: dict(),
                 dependency: dict(),
                 profile: dict(),
                 columns: dict() = None,
                 #functions: dict() = None,
                 ):
        self.dataset_name = dataset_name
        self.number_of_tables = number_of_tables
        self.table_names = table_names
        self.table_indexes = table_indexes
        self.columns = columns
        self.dependency = dependency
        #self.functions = functions
        self.profile = profile

    def get_dataset_name(self) -> str:
        return self.dataset_name

    def get_number_of_tables(self) -> int:
        return self.number_of_tables

    def get_table_names(self) -> list:
        return [tbl for tbl in self.table_names]

    def get_table_indexes(self):
        return self.table_indexes

    def get_columns(self):
        return self.columns

    def get_dependency(self):
        return self.dependency

    def get_profile(self):
        return self.profile

    def metadata_to_dict(self):
        profile_dict = {'dataset_name': self.get_dataset_name(),
                         'number_of_tables': self.get_number_of_tables(),
                         'table_names': self.get_table_names(),
                         'table_indexes': self.get_table_indexes(),
                         #'schema': self.get_schema(),
                         'dependency': self.get_dependency(),
                         'profile': self.get_profile()
                        }
        return profile_dict

    def table_to_dict(self, table_name: str):
        profile_dict = {'table': table_name, 'rows': self.get_profile()[table_name]['rows'] ,'columns': self.get_columns()[table_name]}
        return profile_dict


def _get_table_names(cursor):
    from util.Config import _query_table_list
    res = PostgreDB.execute(cursor=cursor, query=_query_table_list)
    tbls = []
    for (tbl_name,) in res:
        tbls.append(tbl_name)
    return tbls


def _get_table_schema(table_name: str):
    from util.Config import _query_table_schema
    conn, cursor = PostgreDB.connect()
    res = PostgreDB.execute(cursor=cursor, query=_query_table_schema.format(table_name))
    schema = []
    for (column_name, data_type) in res:
        sres = dict()
        sres["name"] = column_name
        sres["type"] = data_type
        schema.append(sres)
    cursor.close()
    conn.close()
    return schema


def _get_table_indexes(table_name: str):
    from util.Config import _query_table_indexes
    conn, cursor = PostgreDB.connect()
    res = PostgreDB.execute(cursor=cursor, query=_query_table_indexes.format(table_name))
    indexes = []
    for (index,) in res:
        result = re.search('\((.*)\)', index)
        indexes.append(result.group(1))
    cursor.close()
    conn.close()
    return indexes


def _get_table_PK_FK(table_name: str):
    from util.Config import _query_table_FPK_FK
    conn, cursor = PostgreDB.connect()
    res = PostgreDB.execute(cursor=cursor, query=_query_table_FPK_FK.format(table_name))
    PKs = []
    FKs = []
    for (table_name, column_name, foreign_table_name, foreign_column_name, constraint_type) in res:
        if constraint_type == "PRIMARY KEY":
            PKs.append(column_name)
        elif constraint_type == "FOREIGN KEY":
            fkres = dict()
            fkres["column_name"] = column_name
            fkres["foreign_table_name"] = foreign_table_name
            fkres["foreign_column_name"] = foreign_column_name
            FKs.append(fkres)
    result = dict()
    result["primary_key"] = PKs
    result["foreign_key"] = FKs
    cursor.close()
    conn.close()
    return result


def _get_table_profile(cursor, table_name: str, columns: [], primary_keys: []):
    from util.Config import _query_table_profile, _query_table_cardinality
    profile = dict()
    numerical_profile = []
    other_profile = []
    ncols_numerical = 0
    col_id = dict()
    other_cols=[]
    (nrows,) = PostgreDB.execute(cursor=cursor, query=_query_table_cardinality.format(table_name))[0]
    profile['rows'] = int(nrows)
    for s in columns:
        col_name = s["name"]
        col_data_type = s["type"]
        if col_data_type in {"smallint", "integer", "bigint", "decimal", "numeric", "real", "double precision",
                             "smallserial", "serial", "bigserial"} and col_name not in primary_keys:
            numerical_profile.append(f"min(T.{col_name}) AS min_{col_name}")
            numerical_profile.append(f"max(T.{col_name}) AS max_{col_name}")
            numerical_profile.append(f"avg(T.{col_name}) AS avg_{col_name}")
            numerical_profile.append(f"stddev(T.{col_name}) AS stddev_{col_name}")
            numerical_profile.append(f"sum(T.{col_name}) AS sum_{col_name}")
            numerical_profile.append(f"count(DISTINCT T.{col_name}) AS DISTINCT_{col_name}")
            col_id[ncols_numerical] = col_name
            ncols_numerical += 1
        else:
            other_profile.append(f"count(DISTINCT T.{col_name}) AS DISTINCT_{col_name}")
            other_cols.append(col_name)

    if ncols_numerical > 0:
        # 200 cols in each time
        max_col_count = 200 * 6
        numerical_profile_count = len(numerical_profile)
        ch_count = math.ceil(numerical_profile_count / max_col_count)
        col_id_index = 0
        for i in range(0, ch_count):
            b_position = i * max_col_count
            e_position = min((i+1)*max_col_count, numerical_profile_count)
            numerical_profile_cols = ",".join(numerical_profile[b_position:e_position])
            res_numerical = PostgreDB.execute(cursor=cursor, query=_query_table_profile.format(numerical_profile_cols, f"{table_name} T"))
            for res in res_numerical:
                b = 0
                ncols_chunck = (e_position - b_position) / 6
                ncols_chunck = int(ncols_chunck)
                for n in range(ncols_chunck):
                    col_profile = dict()
                    try:
                        col_profile["min"] = float(res[b])
                        col_profile["max"] = float(res[b + 1])
                        col_profile["avg"] = float(res[b + 2])
                        col_profile["stddev"] = float(res[b + 3])
                        col_profile["sum"] = float(res[b + 4])
                    except:
                        pass
                    col_profile["distinct_count"] = res[b + 5]
                    b += 6
                    profile[col_id[col_id_index]] = col_profile
                    col_id_index += 1
    if len(other_profile) > 0:
        other_profile = ",".join(other_profile)
        res_other = PostgreDB.execute(cursor=cursor, query=_query_table_profile.format(other_profile, f"{table_name} T"))
        for res in res_other:
            for col_name in other_cols:
                col_profile = dict()
                col_profile["distinct_count"] = res[0]
                profile[col_name] = col_profile
    return profile

def _get_table_profile_mthread(profile, cursor, table_name: str, columns: [], primary_keys: [], thread_name: str):
    from util.Config import _query_table_profile, _query_table_cardinality
    numerical_profile = []
    other_profile = []
    ncols_numerical = 0
    col_id = dict()
    other_cols=[]
    if 'rows' not in profile:
        (nrows,) = PostgreDB.execute(cursor=cursor, query=_query_table_cardinality.format(table_name))[0]
        profile['rows'] = int(nrows)

    for s in columns:
        col_name = s["name"]
        col_data_type = s["type"]
        if col_data_type in {"smallint", "integer", "bigint", "decimal", "numeric", "real", "double precision",
                             "smallserial", "serial", "bigserial"} and col_name not in primary_keys:
            numerical_profile.append(f"min(T.{col_name}) AS min_{col_name}")
            numerical_profile.append(f"max(T.{col_name}) AS max_{col_name}")
            numerical_profile.append(f"avg(T.{col_name}) AS avg_{col_name}")
            numerical_profile.append(f"stddev(T.{col_name}) AS stddev_{col_name}")
            numerical_profile.append(f"sum(T.{col_name}) AS sum_{col_name}")
            numerical_profile.append(f"count(DISTINCT T.{col_name}) AS DISTINCT_{col_name}")
            col_id[ncols_numerical] = col_name
            ncols_numerical += 1
        else:
            other_profile.append(f"count(DISTINCT T.{col_name}) AS DISTINCT_{col_name}")
            other_cols.append(col_name)

    if ncols_numerical > 0:
        # 200 cols in each time
        max_col_count = 200 * 6
        numerical_profile_count = len(numerical_profile)
        ch_count = math.ceil(numerical_profile_count / max_col_count)
        col_id_index = 0
        for i in range(0, ch_count):
            b_position = i * max_col_count
            e_position = min((i+1)*max_col_count, numerical_profile_count)
            numerical_profile_cols = ",".join(numerical_profile[b_position:e_position])
            res_numerical = PostgreDB.execute(cursor=cursor, query=_query_table_profile.format(numerical_profile_cols, f"{table_name} T"))
            for res in res_numerical:
                b = 0
                ncols_chunck = (e_position - b_position) / 6
                ncols_chunck = int(ncols_chunck)
                for n in range(ncols_chunck):
                    col_profile = dict()
                    try:
                        col_profile["min"] = float(res[b])
                        col_profile["max"] = float(res[b + 1])
                        col_profile["avg"] = float(res[b + 2])
                        col_profile["stddev"] = float(res[b + 3])
                        col_profile["sum"] = float(res[b + 4])
                    except:
                        pass
                    col_profile["distinct_count"] = res[b + 5]
                    b += 6
                    profile[col_id[col_id_index]] = col_profile
                    col_id_index += 1
    if len(other_profile) > 0:
        other_profile = ",".join(other_profile)
        res_other = PostgreDB.execute(cursor=cursor, query=_query_table_profile.format(other_profile, f"{table_name} T"))
        for res in res_other:
            for col_name in other_cols:
                col_profile = dict()
                col_profile["distinct_count"] = res[0]
                profile[col_name] = col_profile
    return profile

def _save_catalog(catalog: CatalogInfo, save_path:str=None):
    metadata_fname = f"{save_path}/metadata.json"
    schema_json_fname = f"{save_path}/schema.json"
    with open(metadata_fname, 'w') as f:
        json.dump(catalog.metadata_to_dict(), f, ensure_ascii=False, indent=4)

    schema_json = []
    for tbl in catalog.get_table_names():
        table_fname= f"{save_path}/{tbl}.json"
        with open(table_fname, 'w') as f:
            item = catalog.table_to_dict(table_name=tbl)
            schema_json.append(item)
            json.dump(item, f, ensure_ascii=False, indent=4)

    with open(schema_json_fname, 'w') as f:
        json.dump(schema_json, f, ensure_ascii=False, indent=4)


def load_catalog(catalog_path: str = None):
    from util.Config import _llm_model, _dbms
    metadata_fname = f"{catalog_path}/metadata.json"
    with open(metadata_fname, 'r') as file:
        raw_data = file.read().replace('\n', '')
        json_data = json.loads(raw_data)
        catalog = CatalogInfo(**json_data)
        # load table metadata
        schema = dict()
        # functions = dict()
        for tbl in catalog.get_table_names():
            table_fname = f"{catalog_path}/{tbl}.json"
            with open(table_fname, 'r') as file:
                raw_data = file.read().replace('\n', '')
                json_data = json.loads(raw_data)
                schema[tbl] = json_data["columns"]
        catalog.schema = schema
        #catalog.functions = functions
        return catalog


def _mthread_worker(task: queue.Queue, profile, cursor):
        while True:
            try:
                task_list = task.get(timeout=1)
            except queue.Empty:
                break

            thread_name = threading.current_thread().name
            table_tasks = dict()
            for (tbl, tc, pk) in task_list:
                if tbl not in table_tasks:
                    table_tasks[tbl] = {"columns": [tc], "primary_keys":pk}
                else:
                    table_tasks[tbl]["columns"].append(tc)

            for tbl in table_tasks.keys():
                _get_table_profile_mthread(profile[tbl], cursor, tbl, table_tasks[tbl]["columns"], table_tasks[tbl]["primary_keys"], thread_name)
            task.task_done()


def _mthread_worker_schema(task: queue.Queue, columns, dependency, table_indexes):
    while True:
        try:
            (task_name, tbl) = task.get(timeout=1)
        except queue.Empty:
            break


        if task_name == "tbl_colnames":
            columns[tbl] = _get_table_schema(table_name=tbl)
        elif task_name == "tbl_indexes":
            table_indexes[tbl] = _get_table_indexes(table_name=tbl)
        elif task_name == "tbl_dependency":
            dependency[tbl] = _get_table_PK_FK(table_name=tbl)

        task.task_done()


def split_into_chunks(lst, n):
    if n <= 0:
        raise ValueError("n must be a positive integer")

    k, m = divmod(len(lst), n)
    chunks = []
    start = 0
    for i in range(n):
        end = start + k + (1 if i < m else 0)
        chunks.append(lst[start:end])
        start = end

    return chunks



def build_database_catalog_mthread(save_path: str=None):
    from util.Config import _dataset_name
    number_threads = multiprocessing.cpu_count()

    conn, cursor = PostgreDB.connect()
    table_names = _get_table_names(cursor=cursor)
    cursor.close()
    conn.close()

    table_indexes = dict()
    columns = dict()
    dependency = dict()
    profile = dict()
    task_pair_list_numeric = []
    task_pair_list_other = []
    task_pair = queue.Queue()
    schema_pair = queue.Queue()
    task_profile = dict()

    for tbl in table_names:
        schema_pair.put(("tbl_colnames", tbl))
        schema_pair.put(("tbl_index", tbl))
        schema_pair.put(("tbl_dependency", tbl))
    threads = []
    for i in range(number_threads):
        thread_name = f"thread_{i}"
        t = threading.Thread(target=_mthread_worker_schema, args=(schema_pair, columns, dependency, table_indexes), name=thread_name)
        t.start()
        threads.append(t)

    # Wait for all tasks in the queue to be processed
    schema_pair.join()
    for i, t in enumerate(threads):
        t.join()

    for tbl in table_names:
        task_profile[tbl] = dict()
        for tc in columns[tbl]:
            col_data_type = tc["type"]
            col_name = tc["name"]
            if col_data_type in {"smallint", "integer", "bigint", "decimal", "numeric", "real", "double precision",
                                 "smallserial", "serial", "bigserial"} and col_name not in dependency[tbl][
                "primary_key"]:
                task_pair_list_numeric.append((tbl, tc, dependency[tbl]["primary_key"]))
            else:
                task_pair_list_other.append((tbl, tc, dependency[tbl]["primary_key"]))

            # task_pair.put((tbl, tc, dependency[tbl]["primary_key"]))
    numeric_chunks = split_into_chunks(task_pair_list_numeric, number_threads)
    other_chunks = split_into_chunks(task_pair_list_other, number_threads)
    for i in range(0, number_threads):
        fl = []
        if i < len(numeric_chunks):
            fl.extend(numeric_chunks[i])
        if i < len(other_chunks):
            fl.extend(other_chunks[i])
        task_pair.put(fl)
    # Create and start threads
    threads = []
    connections = dict()
    for i in range(number_threads):
        pg = PostgreDB()
        conn, cursor = pg.connect()
        thread_name = f"thread_{i}"
        connections[thread_name] = (pg, conn, cursor)
        t = threading.Thread(target=_mthread_worker, args=(task_pair, task_profile, cursor), name=thread_name)
        t.start()
        threads.append(t)

    # Wait for all tasks in the queue to be processed
    task_pair.join()
    for i, t in enumerate(threads):
        t.join()
        thread_name = f"thread_{i}"
        (pg, conn, cursor) = connections[thread_name]
        pg.close_connect(conn=conn, cursor=cursor)
    for tbl in table_names:
        profile[tbl] = task_profile[tbl]
    catalog = CatalogInfo(dataset_name=_dataset_name,
                          number_of_tables=len(table_names),
                          table_names=table_names,
                          table_indexes=table_indexes,
                          columns=columns,
                          dependency=dependency,
                          profile=profile)
    if save_path is not None:
        _save_catalog(catalog=catalog, save_path=save_path)
    return catalog

