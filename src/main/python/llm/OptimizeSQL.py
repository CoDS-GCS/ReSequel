from prompt.PromptBuilder import prompt_factory, prompt_factory_generate_queries, prompt_factory_verify_queries
from llm.OptimizeLLMSQL import OptimizeLLMSQL
from llm.InquiryLLM import InquiryLLM
from util.FileHandler import save_prompt
from util.LogResults import save_llm_log, save_judge_log
import time


def optimize_and_verify_queries(llm_model: str,
                       output_path: str,
                       result_log_path: str,
                       catalog, work_load: [],
                       log_name: str,
                       time_catalog: float = 0):
    from util.Config import _dbms
    time_generate = 0
    time_start_1 = time.time()  # Start Time
    prompt = prompt_factory(catalog=catalog, work_load=work_load)

    time_end_1 = time.time()  # End time
    time_generate += time_end_1 - time_start_1  # Add prompt construction time to pipeline generate time

    prompt_format = prompt.format()
    prompt_system_message = prompt_format["system_message"]
    prompt_user_message = prompt_format["user_message"]

    # Save prompt:
    prompt_file_name = f"{llm_model}-{_dbms}-{log_name}"
    file_name = f'{output_path}/{prompt_file_name}'

    prompt_fname = f"{file_name}.prompt"
    save_prompt(fname=prompt_fname, system_message=prompt_system_message, user_message=prompt_user_message)

    # Optimize SQL Queries
    sql,_, all_token_count, time_tmp_gen = OptimizeLLMSQL.optimize_llm_sql(user_message=prompt_user_message,
                                                                             system_message=prompt_system_message)
    time_generate += time_tmp_gen

    save_llm_log(llm_model=llm_model, result_log_path=result_log_path, time_catalog=time_catalog,
                 time_total=time_generate, part_number=log_name,
                 all_token_count=all_token_count)
    if len(sql) > 10:
        return sql
    else:
        return None


def generate_queries(llm_model: str,
                     output_path: str,
                     result_log_path: str,
                     catalog,
                     template: str,
                     log_name: str,
                     time_catalog: float = 0,
                     list_size: int = 10,):
    from util.Config import _dbms
    time_generate = 0
    time_start_1 = time.time()  # Start Time
    prompt = prompt_factory_generate_queries(catalog=catalog, template=template, list_size=list_size)

    time_end_1 = time.time()  # End time
    time_generate += time_end_1 - time_start_1  # Add prompt construction time to pipeline generate time

    prompt_format = prompt.format()
    prompt_system_message = prompt_format["system_message"]
    prompt_user_message = prompt_format["user_message"]

    # Save prompt:
    prompt_file_name = f"{llm_model}-{_dbms}-{log_name}"
    file_name = f'{output_path}/{prompt_file_name}'

    prompt_fname = f"{file_name}.prompt"
    save_prompt(fname=prompt_fname, system_message=prompt_system_message, user_message=prompt_user_message)

    # Optimize SQL Queries
    sqls,_, all_token_count, time_tmp_gen = OptimizeLLMSQL.optimize_llm_sql(user_message=prompt_user_message,
                                                                             system_message=prompt_system_message)
    time_generate += time_tmp_gen

    save_llm_log(llm_model=llm_model, result_log_path=result_log_path, time_catalog=time_catalog,
                 time_total=time_generate, part_number=log_name,
                 all_token_count=all_token_count)
    if len(sqls) > 0:
        return sqls
    else:
        return None


def verify_queries(llm_model: str,
                     output_path: str,
                     result_log_path: str,
                     catalog,
                     template: str,
                     queries: [],
                     log_name: str,
                     time_catalog: float = 0,
                     template_id: str = None):

    from util.Config import _dbms
    time_verify = 0
    time_start_1 = time.time()  # Start Time
    prompt = prompt_factory_verify_queries(catalog=catalog, template=template, queries=queries)

    time_end_1 = time.time()  # End time
    time_verify += time_end_1 - time_start_1  # Add prompt construction time to pipeline generate time

    prompt_format = prompt.format()
    prompt_system_message = prompt_format["system_message"]
    prompt_user_message = prompt_format["user_message"]

    # Optimize SQL Queries
    llm_response,all_token_count, time_tmp_gen = InquiryLLM.inquiry_llm(user_message=prompt_user_message,
                                                                        system_message=prompt_system_message)
    time_verify += time_tmp_gen
    verified_queries = []
    failed_queries = []

    rows = llm_response.splitlines()
    for row in rows:
        rds = row.split(":")
        if len(rds) == 2 :
            rewrite_id = rds[0].split("#QUERY ")
            if len(rewrite_id) == 2:
                rewrite_id = rewrite_id[1].strip()
            else:
                failed_queries.append("-1")
                continue
            verify_response = rds[1].strip()

            if verify_response == "Yes":
                verified_queries.append(rewrite_id)
            else:
                failed_queries.append(rewrite_id)

    save_judge_log(result_log_path=result_log_path, llm_model=llm_model, time_catalog_load=time_catalog,
                   time_total=time_verify, verified_queries=verified_queries, failed_queries=failed_queries,
                   all_token_count=all_token_count, query_id=template_id )

    # Save prompt:
    prompt_file_name = f"{llm_model}-{_dbms}-{log_name}-judge"
    file_name = f'{output_path}/{prompt_file_name}'

    prompt_fname = f"{file_name}.prompt"
    save_prompt(fname=prompt_fname, system_message=prompt_system_message, user_message=f"{prompt_user_message}\n-------------------RESULT -------\n{llm_response}")

    return verified_queries