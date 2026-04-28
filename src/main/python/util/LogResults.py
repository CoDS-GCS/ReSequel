import pandas as pd


class LogLLMResults(object):
    def __init__(self,
                 llm_model: str,
                 part_number: int,
                 time_catalog_load: float,
                 time_total: float,
                 all_token_count: int = 0
                 ):
        self.llm_model = llm_model
        self.part_number = part_number
        self.time_catalog_load = time_catalog_load
        self.time_total = time_total
        self.all_token_count = all_token_count
        self.columns = ["dataset_name", "dbms", "llm_model", "part_number", "time_catalog_load", "time_total", "all_token_count"]

    def save_results(self, result_output_path: str):
        from util.Config import _dataset_name, _dbms
        try:
            df_result = pd.read_csv(result_output_path)

        except Exception as err:
            df_result = pd.DataFrame(columns=self.columns)

        df_result.loc[len(df_result)] = [_dataset_name, _dbms , self.llm_model, self.part_number, self.time_catalog_load,
                                         self.time_total, self.all_token_count]
        df_result.to_csv(result_output_path, index=False)


def save_llm_log(llm_model,result_log_path, time_catalog, time_total, all_token_count, part_number):
    log_results = LogLLMResults(llm_model=llm_model, time_catalog_load=time_catalog, time_total=time_total,
                                all_token_count=all_token_count, part_number=part_number)
    log_results.save_results(result_output_path=result_log_path)


class LogWorkloadResults(object):
    def __init__(self,
                 query_ID: int,
                 # method: str,
                 total_time: float,
                 planning_time: float,
                 execution_time: float
                 ):
        self.query_ID = query_ID
        # self.method = method
        self.total_time = total_time
        self.planning_time = planning_time
        self.execution_time = execution_time

        self.columns = ["query_ID", "total_time", "planning_time", "execution_time"]

    def save_results(self, result_output_path: str):
        try:
            df_result = pd.read_csv(result_output_path)

        except Exception as err:
            df_result = pd.DataFrame(columns=self.columns)

        df_result.loc[len(df_result)] = [self.query_ID,  self.total_time, self.planning_time, self.execution_time]
        df_result['query_ID'] = df_result['query_ID'].astype(int)
        df_result.to_csv(result_output_path, index=False)

class LogVerifyResults(object):
    def __init__(self,
                 query_id: str,
                 llm_model: str,
                 time_catalog_load: float,
                 time_total: float,
                 all_token_count: int = 0,
                 verified_count: int = 0,
                 failed_count: int =0,
                 verified_queries: str = "",
                 failed_queries: str = "",
                 ):
        self.llm_model = llm_model
        self.time_catalog_load = time_catalog_load
        self.time_total = time_total
        self.all_token_count = all_token_count
        self.verified_count = verified_count
        self.failed_count = failed_count
        self.verified_queries = verified_queries
        self.failed_queries = failed_queries
        self.query_ID = query_id

        self.columns = ["dataset_name", "dbms", "llm_model", "query_id", "verified_count", "failed_count",
                        "total_count", "verified_queries", "failed_queries",  "time_catalog_load", "time_total", "all_token_count" ]


    def save_results(self, result_output_path: str):
        from util.Config import _dataset_name, _dbms
        try:
            df_result = pd.read_csv(result_output_path)

        except Exception as err:
            df_result = pd.DataFrame(columns=self.columns)

        df_result.loc[len(df_result)] = [_dataset_name, _dbms, self.llm_model, self.query_ID, self.verified_count, self.failed_count,
                                         self.verified_count+self.failed_count, self.verified_queries, self.failed_queries,
                                         self.time_catalog_load, self.time_total, self.all_token_count]
        df_result.to_csv(result_output_path, index=False)


class LogTemplateResults(object):
    def __init__(self ):
        self.columns = [ "dataset_name","dbms","template_id", "queries","query_count"]
        self.df_result = pd.DataFrame(columns=self.columns)

    def add_result(self, template_id, queries):
        from util.Config import _dataset_name, _dbms
        self.df_result.loc[len(self.df_result)] = [_dataset_name, _dbms, template_id, ";".join(queries), len(queries)]

    def save_results(self, result_output_path: str):
        self.df_result.to_csv(result_output_path, index=False)


def save_workload_log(result_log_path, query_ID: int, total_time: float, planning_time: float, execution_time: float):
    log_results = LogWorkloadResults(query_ID=query_ID, total_time=total_time,
                                     planning_time=planning_time, execution_time=execution_time)
    log_results.save_results(result_output_path=result_log_path)

def save_judge_log(result_log_path, query_id: str,
                 llm_model: str,
                 time_catalog_load: float,
                 time_total: float,
                 all_token_count: int,
                 verified_queries: [],
                 failed_queries: []):

    log_results = LogVerifyResults(query_id=query_id,llm_model=llm_model,time_total=time_total,time_catalog_load=time_catalog_load,
                                   all_token_count=all_token_count, verified_count=len(verified_queries), failed_count=len(failed_queries),
                                   verified_queries=";".join(verified_queries), failed_queries=";".join(failed_queries))
    log_results.save_results(result_output_path=result_log_path)