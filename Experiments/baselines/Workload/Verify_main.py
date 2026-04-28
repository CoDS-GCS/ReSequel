from Database import PostgreDB, DuckDB, MySQLDB
from FileHandler import read_text_file_line_by_line, save_text_file
from LogResults import LogVerifyResults
import time
import os
import queue
import threading
import multiprocessing
import pandas as pd


class VerifyPG(object):
    def __init__(self, workload_path: str, rewrite_path: str, queries, database_name: str, dbms: str,
                 output_path_verify: str, output_path_select: str, verify_log_path: str):
        self.workload_path = workload_path
        self.rewrite_path = rewrite_path
        self.database_name = database_name
        self.dbms = dbms
        self.output_path_verify = output_path_verify
        self.output_path_select = output_path_select
        self.queries = queries
        self.verify_log_path = verify_log_path

        self.impl_funcs= ""
        self.connections = dict()
        self.results_lock = threading.Lock()
        self.log = LogVerifyResults()
        self.query_results = dict()
        self.query_verify_results = dict()

        # Worker function for threads
    def _worker_main(self):
        while True:
            try:
                query = self.queries.get(timeout=1)
            except queue.Empty:
                break

            thread_name = threading.current_thread().name
            query_fname = f"{self.workload_path}/{query}.sql"
            self._run_main_queries(query, query_fname, thread_name, True)
            self.queries.task_done()

    def _worker_rewrite(self, queries):
        while True:
            try:
                (query,vi) = queries.get(timeout=1)
            except queue.Empty:
                break

            self._run_rewrite_queries(vi, query)
            queries.task_done()


    def _run_main_queries(self, query, query_fname, thread_name, add_result_or_return):
        query_str = read_text_file_line_by_line(query_fname)
        if add_result_or_return:
            (pg, conn, cursor) = self.connections[thread_name]
            res_an = pg.execute(cursor=cursor, query=query_str)
            with self.results_lock:
                self.query_results[query] = res_an
                self.query_verify_results[query] = {"verified_queries":[], "error_queries": [], "failed_queries": [], "query_elapsed_time": dict(), "selected_query": None}
        else:
            pg = PostgreDB()
            conn, cursor = pg.connect()
            elapsed_time = -1
            res_an = None
            try:
                start = time.time()
                res_an = pg.execute(cursor=cursor, query=query_str)
                end = time.time()
                elapsed_time = end - start
            except:
                pass

            pg.close_connect(conn=conn, cursor=cursor)
            return elapsed_time, res_an

    def _run_rewrite_queries(self, query, main_query):
        query_rewrite_fname = f"{self.rewrite_path}/{main_query}-{query}.sql"
        if os.path.exists(query_rewrite_fname):
            rewrite_elapsed_time, rewrite_result = self._run_main_queries(query=query, query_fname=query_rewrite_fname,
                                                        thread_name=None, add_result_or_return=False)
            query_result = self.query_results[main_query]

            if rewrite_result == query_result:
                with self.results_lock:
                    self.query_verify_results[main_query]["verified_queries"].append(query)
                    self.query_verify_results[main_query]["query_elapsed_time"][query] = rewrite_elapsed_time

                    query_str =f"{self.impl_funcs} \n {read_text_file_line_by_line(query_rewrite_fname)}"
                    query_rewrite_fname = f"{self.output_path_verify}/{main_query}-{query}.sql"
                    save_text_file(query_rewrite_fname, query_str)

            elif rewrite_result is None:
                with self.results_lock:
                    self.query_verify_results[main_query]["error_queries"].append(query)
            else:
                with self.results_lock:
                    self.query_verify_results[main_query]["failed_queries"].append(query)

    def _run_implemented_functions(self, main_query):
        fun_fname = f"{self.rewrite_path}/{main_query}-0.sql"
        if os.path.exists(fun_fname):
            try:
                query_str = read_text_file_line_by_line(fun_fname)
                pg = PostgreDB()
                conn, cursor = pg.connect()
                res_an = pg.execute(cursor=cursor, query=query_str)
                pg.close_connect(conn=conn, cursor=cursor)
                self.impl_funcs = query_str + "\n"
            except Exception as e:
                pass

    def run(self):
        number_threads = multiprocessing.cpu_count()

        # Create and start threads
        threads = []
        for i in range(number_threads):
            pg = PostgreDB()
            conn, cursor = pg.connect()
            thread_name = f"thread_{i}"
            self.connections[thread_name] = (pg, conn, cursor)
            t = threading.Thread(target=self._worker_main, args=(), name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        self.queries.join()

        for i, t in enumerate(threads):
            t.join()
            thread_name = f"thread_{i}"
            (pg, conn, cursor) = self.connections[thread_name]
            pg.close_connect(conn=conn, cursor=cursor)


        version_queries = queue.Queue()
        for query in self.query_results.keys():
            self._run_implemented_functions(main_query=query)
            for vi in range(1, 32):
                version_queries.put((query, f"{vi}"))


        threads = []
        for i in range(number_threads):
            thread_name = f"thread_{i}"
            t = threading.Thread(target=self._worker_rewrite, args=(version_queries,), name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        version_queries.join()

        for i, t in enumerate(threads):
            t.join()

        #for query in self.query_results.keys():
        for query in self.query_results.keys():
                results = self.query_verify_results[query]
                min_time = -1
                selected_version = "-1"
                for qvi in results["query_elapsed_time"].keys():
                    query_time = results["query_elapsed_time"][qvi]
                    if query_time < min_time or min_time == -1:
                        min_time = query_time
                        results["selected_query"] = qvi
                        selected_version = qvi

                if selected_version != "-1" :
                    results["selected_query"] = selected_version
                    self.log.add_results(query_id=query, results=results)
                    query_selected_fname = f"{self.output_path_select}/{query}.sql"
                    query_rewrite_fname = f"{self.rewrite_path}/{query}-{selected_version}.sql"
                    query_str = read_text_file_line_by_line(query_rewrite_fname)
                    save_text_file(query_selected_fname, query_str)
                else:
                    print(f"Unverified Query: {query}")

        self.log.save_results(f"{self.verify_log_path}")


class VerifyDuckDB(object):
    def __init__(self, workload_path: str, rewrite_path: str, queries, database_name: str, dbms: str,
                 output_path_verify: str, output_path_select: str,  verify_log_path: str):
        self.workload_path = workload_path
        self.rewrite_path = rewrite_path
        self.database_name = database_name
        self.dbms = dbms
        self.output_path_verify = output_path_verify
        self.output_path_select = output_path_select
        self.queries = queries
        self.verify_log_path = verify_log_path

        self.version_queries = queue.Queue()
        self.connections = dict()
        self.results_lock = threading.Lock()
        self.log = LogVerifyResults()
        self.query_results = dict()
        self.query_verify_results = dict()
        self.query_elapsed_time_results = dict()

    def are_dataframes_equal(self, df1: pd.DataFrame, df2: pd.DataFrame) -> bool:
        if df1 is None and df2 is None:
            return True
        if df1 is None or df2 is None:
            return False

        # Check if the shapes match first
        if df1.shape != df2.shape:
            return False

        # Compare the values directly, ignoring column names
        return (df1.values == df2.values).all()


    def _worker_main(self):
        while True:
            try:
                query = self.queries.get(timeout=1)
            except queue.Empty:
                break

            thread_name = threading.current_thread().name
            query_fname = f"{self.workload_path}/{query}.sql"
            self._run_main_queries(query, query_fname, thread_name, True)
            self.queries.task_done()

    def _worker_rewrite(self):
        while True:
            try:
                (query,vi) = self.version_queries.get(timeout=1)
            except queue.Empty:
                break

            try:
                thread_name = threading.current_thread().name
                query_result = self.query_results[query]
                query_elapsed_time = self.query_elapsed_time_results[query] * 3 + 20
                rewrite_elapsed_time, rewrite_result = self.run_with_timeout(self._run_rewrite_queries, args=(f"{vi}", query, thread_name), timeout=query_elapsed_time)
                if self.are_dataframes_equal(rewrite_result, query_result):
                    self.query_verify_results[query]["verified_queries"].append(f"{vi}")
                    self.query_verify_results[query]["query_elapsed_time"][f"{vi}"] = rewrite_elapsed_time

                    query_rewrite_fname = f"{self.rewrite_path}/{query}-{vi}.sql"
                    query_str = read_text_file_line_by_line(query_rewrite_fname)

                    query_rewrite_fname = f"{self.output_path_verify}/{query}-{vi}.sql"
                    save_text_file(query_rewrite_fname, query_str)


                elif rewrite_result is None:
                    self.query_verify_results[query]["error_queries"].append(f"{vi}")
                else:
                    self.query_verify_results[query]["failed_queries"].append(f"{vi}")
            except TimeoutError as e:
                print(f"Timeout {query}: {vi}")


            self.version_queries.task_done()

    def run_with_timeout(self, func, args=(), kwargs={}, timeout=5):
        def wrapper(queue, *args, **kwargs):
            try:
                result = func(*args, **kwargs)
                queue.put(('result', result))
            except Exception as e:
                queue.put(('error', e))

        queue = multiprocessing.Queue()
        process = multiprocessing.Process(target=wrapper, args=(queue, *args), kwargs=kwargs)
        process.start()
        process.join(timeout)

        if process.is_alive():
            process.terminate()
            process.join()
            raise TimeoutError(f"Function call exceeded time limit of {timeout} seconds")

        if not queue.empty():
            status, value = queue.get()
            if status == 'result':
                return value
            else:
                raise value
        else:
            raise RuntimeError("Function ended but did not return any result")

    def _run_main_queries(self, query, query_fname, thread_name, add_result_or_return):
        query_str = read_text_file_line_by_line(query_fname)
        (ddb, conn) = self.connections[thread_name]
        if add_result_or_return:
            start = time.time()
            res_an = ddb.execute(conn=conn, query=query_str)
            end = time.time()
            elapsed_time = end - start
            self.query_elapsed_time_results[query] = elapsed_time
            self.query_results[query] = res_an
            self.query_verify_results[query] = {"verified_queries":[], "error_queries": [], "failed_queries": [], "query_elapsed_time": dict(), "selected_query": None}
        else:
            elapsed_time = -1
            res_an = None
            try:
                start = time.time()
                res_an = ddb.execute(conn=conn, query=query_str)
                end = time.time()
                elapsed_time = end - start
            except:
                pass
            return elapsed_time, res_an

    def _run_rewrite_queries(self, query, main_query, thread_name):
        query_rewrite_fname = f"{self.rewrite_path}/{main_query}-{query}.sql"
        if os.path.exists(query_rewrite_fname):
            rewrite_elapsed_time, rewrite_result = self._run_main_queries(query=query, query_fname=query_rewrite_fname,
                                                        add_result_or_return=False, thread_name=thread_name)
            return rewrite_elapsed_time, rewrite_result
        else:
            return None, None

    def run(self):
        number_threads = multiprocessing.cpu_count()

        # Create and start threads
        threads = []
        for i in range(number_threads):
            ddb = DuckDB()
            conn = ddb.connect()
            thread_name = f"thread_{i}"
            self.connections[thread_name] = (ddb, conn)
            t = threading.Thread(target=self._worker_main, args=(), name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        self.queries.join()

        for query in self.query_results.keys():
            for vi in range(1, 32):
                self.version_queries.put((query, f"{vi}"))

        threads = []
        for i in range(number_threads):
            thread_name = f"thread_{i}"
            t = threading.Thread(target=self._worker_rewrite, args=(), name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        self.version_queries.join()

        for i, t in enumerate(threads):
            t.join()

        for i, t in enumerate(threads):
            t.join()
            thread_name = f"thread_{i}"
            (ddb, conn) = self.connections[thread_name]
            ddb.close_connect(conn=conn)

        for query in self.query_results.keys():
            results = self.query_verify_results[query]
            min_time = -1
            selected_version = "-1"
            for qvi in results["query_elapsed_time"].keys():
                query_time = results["query_elapsed_time"][qvi]
                if query_time < min_time or min_time == -1:
                    min_time = query_time
                    results["selected_query"] = qvi
                    selected_version = qvi

            if selected_version != "-1" :
                results["selected_query"] = selected_version
                self.log.add_results(query_id=query, results=results)
                query_selected_fname = f"{self.output_path_select}/{query}.sql"
                query_rewrite_fname = f"{self.rewrite_path}/{query}-{selected_version}.sql"
                query_str = read_text_file_line_by_line(query_rewrite_fname)
                save_text_file(query_selected_fname, query_str)
            else:
                print(f"Unverified Query: {query}")

        self.log.save_results(f"{self.verify_log_path}")


class VerifyMySQL(object):
    def __init__(self, workload_path: str, rewrite_path: str, queries, database_name: str, dbms: str,
                 output_path_verify: str, output_path_select: str,  verify_log_path: str):
        self.workload_path = workload_path
        self.rewrite_path = rewrite_path
        self.database_name = database_name
        self.dbms = dbms
        self.output_path_verify = output_path_verify
        self.output_path_select = output_path_select
        self.queries = queries
        self.verify_log_path = verify_log_path

        self.connections = dict()
        self.version_queries = queue.Queue()
        self.results_lock = threading.Lock()
        self.log = LogVerifyResults()
        self.query_results = dict()
        self.query_verify_results = dict()
        self.query_elapsed_time_results = dict()


    def _worker_main(self):
        while True:
            try:
                query = self.queries.get(timeout=1)
            except queue.Empty:
                break

            thread_name = threading.current_thread().name
            query_fname = f"{self.workload_path}/{query}.sql"
            self._run_main_queries(query, query_fname, thread_name, True)
            self.queries.task_done()

    def _worker_rewrite(self):
        while True:
            try:
                (query,vi) = self.version_queries.get(timeout=1)
            except queue.Empty:
                break

            try:
                thread_name = threading.current_thread().name
                query_result = self.query_results[query]
                #query_elapsed_time = self.query_elapsed_time_results[query] * 5 + 20
                # rewrite_elapsed_time, rewrite_result = self.run_with_timeout(self._run_rewrite_queries, args=(f"{vi}", query, thread_name), timeout=query_elapsed_time)

                rewrite_elapsed_time, rewrite_result = self._run_rewrite_queries(f"{vi}",query, thread_name)
                if rewrite_result == query_result:
                    self.query_verify_results[query]["verified_queries"].append(f"{vi}")
                    self.query_verify_results[query]["query_elapsed_time"][f"{vi}"] = rewrite_elapsed_time

                    query_rewrite_fname = f"{self.rewrite_path}/{query}-{vi}.sql"
                    query_str = read_text_file_line_by_line(query_rewrite_fname)

                    query_rewrite_fname = f"{self.output_path_verify}/{query}-{vi}.sql"
                    save_text_file(query_rewrite_fname, query_str)


                elif rewrite_result is None:
                    self.query_verify_results[query]["error_queries"].append(f"{vi}")
                else:
                    self.query_verify_results[query]["failed_queries"].append(f"{vi}")
            except TimeoutError as e:
                print(f"Timeout {query}: {vi}")

            self.version_queries.task_done()

    # def run_with_timeout(self, func, args=(), kwargs={}, timeout=5):
    #     def wrapper(queue, *args, **kwargs):
    #         try:
    #             result = func(*args, **kwargs)
    #             queue.put(('result', result))
    #         except Exception as e:
    #             queue.put(('error', e))
    #
    #     queue = multiprocessing.Queue()
    #     process = multiprocessing.Process(target=wrapper, args=(queue, *args), kwargs=kwargs)
    #     process.start()
    #     process.join(timeout)
    #
    #     if process.is_alive():
    #         process.terminate()
    #         process.join()
    #         raise TimeoutError(f"Function call exceeded time limit of {timeout} seconds")
    #
    #     if not queue.empty():
    #         status, value = queue.get()
    #         if status == 'result':
    #             return value
    #         else:
    #             raise value
    #     else:
    #         raise RuntimeError("Function ended but did not return any result")

    def _run_main_queries(self, query, query_fname, thread_name, add_result_or_return):
        query_str = read_text_file_line_by_line(query_fname)
        (mysql, conn, cursor) = self.connections[thread_name]
        if add_result_or_return:
            start = time.time()
            res_an = mysql.execute(cursor=cursor, query=query_str)
            end = time.time()
            elapsed_time = end - start
            self.query_elapsed_time_results[query] = elapsed_time
            self.query_results[query] = res_an
            self.query_verify_results[query] = {"verified_queries":[], "error_queries": [], "failed_queries": [], "query_elapsed_time": dict(), "selected_query": None}
        else:
            elapsed_time = -1
            res_an = None
            try:
                start = time.time()
                res_an = mysql.execute(cursor=cursor, query=query_str)
                end = time.time()
                elapsed_time = end - start
            except:
                pass
            return elapsed_time, res_an

    def _run_rewrite_queries(self, query, main_query, thread_name):
        query_rewrite_fname = f"{self.rewrite_path}/{main_query}-{query}.sql"
        if os.path.exists(query_rewrite_fname):
            rewrite_elapsed_time, rewrite_result = self._run_main_queries(query=query, query_fname=query_rewrite_fname,
                                                        add_result_or_return=False, thread_name=thread_name)
            return rewrite_elapsed_time, rewrite_result
        else:
            return None, None

    def run(self):
        number_threads = multiprocessing.cpu_count()

        # Create and start threads
        threads = []
        for i in range(number_threads):
            mysql = MySQLDB()
            conn, cursor = mysql.connect()
            thread_name = f"thread_{i}"
            self.connections[thread_name] = (mysql, conn, cursor)
            t = threading.Thread(target=self._worker_main, args=(), name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        self.queries.join()
        for i, t in enumerate(threads):
            t.join()
            thread_name = f"thread_{i}"
            (pg, conn, cursor) = self.connections[thread_name]
            pg.close_connect(conn=conn, cursor=cursor)

        for query in self.query_results.keys():
            for vi in range(1, 32):
                self.version_queries.put((query, f"{vi}"))

        threads = []
        self.connections = dict()
        for i in range(number_threads):
            mysql = MySQLDB()
            conn, cursor = mysql.connect()
            thread_name = f"thread_{i}"
            self.connections[thread_name] = (mysql, conn, cursor)
            t = threading.Thread(target=self._worker_rewrite,  name=thread_name)
            t.start()
            threads.append(t)

        # Wait for all tasks in the queue to be processed
        self.version_queries.join()

        for i, t in enumerate(threads):
            t.join()
            thread_name = f"thread_{i}"
            (mysql, conn, cursor) = self.connections[thread_name]
            mysql.close_connect(conn=conn, cursor=cursor)

        for query in self.query_results.keys():
            results = self.query_verify_results[query]
            min_time = -1
            selected_version = "-1"
            for qvi in results["query_elapsed_time"].keys():
                query_time = results["query_elapsed_time"][qvi]
                if query_time < min_time or min_time == -1:
                    min_time = query_time
                    results["selected_query"] = qvi
                    selected_version = qvi

            if selected_version != "-1" :
                results["selected_query"] = selected_version
                self.log.add_results(query_id=query, results=results)
                query_selected_fname = f"{self.output_path_select}/{query}.sql"
                query_rewrite_fname = f"{self.rewrite_path}/{query}-{selected_version}.sql"
                query_str = read_text_file_line_by_line(query_rewrite_fname)
                save_text_file(query_selected_fname, query_str)
            else:
                print(f"Unverified Query: {query}")

        self.log.save_results(f"{self.verify_log_path}")