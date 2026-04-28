from prompt.PromptBuilder import prompt_factory_implement
from util.FileHandler import save_prompt
from util.FileHandler import save_text_file
from .OptimizeLLMSQL import OptimizeLLMSQL
from util.LogResults import save_llm_log
import time


def implement_function(llm_model: str,
                       output_path: str,
                       result_log_path: str,
                       catalog,
                       log_name: str,
                       time_catalog: float = 0):
    from util.Config import _dbms
    time_generate = 0

    for tbl in catalog.table_names:
        time_start_1 = time.time()  # Start Time
        prompt = prompt_factory_implement(catalog=catalog, table_name=tbl)
        time_end_1 = time.time()  # End time
        time_generate += time_end_1 - time_start_1  # Add prompt construction time to pipeline generate time

        prompt_format = prompt.format()
        prompt_system_message = prompt_format["system_message"]
        prompt_user_message = prompt_format["user_message"]

        # Save prompt:
        prompt_file_name = f"{tbl}-{llm_model}-{_dbms}-{log_name}"
        file_name = f'{output_path}/{prompt_file_name}'

        prompt_fname = f"{file_name}.prompt"
        save_prompt(fname=prompt_fname, system_message=prompt_system_message, user_message=prompt_user_message)

        # Optimize SQL Queries
        sql, funcs, all_token_count, time_tmp_gen = OptimizeLLMSQL.optimize_llm_sql(user_message=prompt_user_message,
                                                                                 system_message=prompt_system_message)
        time_generate += time_tmp_gen

        if len(sql) > 100:
            queries_fname = f"{file_name}.sql"
            funcs_fname = f"{file_name}.funcs"
            save_text_file(fname=queries_fname, data=sql)
            save_text_file(fname=funcs_fname, data=funcs)

        save_llm_log(llm_model=llm_model, result_log_path=result_log_path, time_catalog=time_catalog, time_total= time_generate, part_number=log_name,
                     all_token_count=all_token_count)