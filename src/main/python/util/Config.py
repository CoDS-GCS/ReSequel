import os
import yaml
from util.FileHandler import read_text_file_line_by_line

from .LLM_API_Key import LLM_API_Key

default_max_token_limit = 4096
default_max_output_tokens = 8192
default_delay = 0
default_temperature = 0
default_top_p = 0.95
default_top_k = 64
default_system_delimiter = "### "
default_user_delimiter = "### "

_pgsql_user = None
_pgsql_password = None
_pgsql_host = None
_pgsql_port = None
_dbms = None
_dataset_name = None

_query_table_list = None
_query_table_schema = None
_query_table_indexes = None
_query_table_FPK_FK = None
_query_table_profile = None
_query_table_cardinality = None
_query_central_table = None
_workload = []
_templates = []
_templates_versions = dict()
_templates_versions_IDS = dict()

CATEGORICAL_RATIO: float = 0.01
LOW_RATIO_THRESHOLD = 0.05
DISTINCT_THRESHOLD = 0.5

_OPENAI = "OpenAI"
_META = "Meta"
_GOOGLE = "Google"
_GROQ = "Groq"

_llm_model = None
_llm_platform = None
_system_delimiter = None
_user_delimiter = None
_max_token_limit = None
_max_out_token_limit = None
_delay = None
_temperature = None
_top_p = None
_top_k = None
_last_API_Key = None
_LLM_API_Key = None
_system_log_file = None

_implement_task = dict()
_setting_rules = dict()
_rules = dict()
_verify = dict()

_CODE_BLOCK = None
_DATASET_DESCRIPTION = None


def load_config_catalog(db_config_path: str = "DBConfig.yaml",
                        db_queries_path: str = "DBCatalogQueries.yaml",
                        dbms: str = "postgresql",
                        dataset_name: str = None):
    global _dataset_name
    global _dbms
    global _database_path

    _dbms = dbms
    _dataset_name = dataset_name
    load_db_config(db_config_path=db_config_path)
    load_db_queries(db_queries_path=db_queries_path)


def load_config_system(system_log: str,
                       llm_model: str = None,
                       config_path: str = "LLMConfig.yaml",
                       api_config_path: str = "APIKeys.yaml",
                       rules_path: str = "Rules_tpc.yaml",
                       workload_path: str = None,
                       template_path: str = None):
    if api_config_path is None:
        api_config_path = os.environ.get("APIKeys_File")
    global _llm_model
    global _llm_platform
    global _system_delimiter
    global _user_delimiter
    global _max_token_limit
    global _max_out_token_limit
    global _delay
    global _last_API_Key
    global _LLM_API_Key
    global _system_log_file
    global _temperature
    global _top_k
    global _top_p
    global _dataset_name
    _system_log_file = system_log

    with open(config_path, "r") as f:
        try:
            configs = yaml.load(f, Loader=yaml.FullLoader)
            for conf in configs:
                plt = conf.get("llm_platform")
                try:
                    if conf.get(llm_model) is not None:
                        _llm_model = llm_model
                        _llm_platform = plt

                        try:
                            _system_delimiter = conf.get(llm_model).get('system_delimiter')
                        except:
                            _system_delimiter = default_system_delimiter

                        try:
                            _user_delimiter = conf.get(llm_model).get('user_delimiter')
                        except:
                            _user_delimiter = default_user_delimiter

                        try:
                            _max_token_limit = int(conf.get(llm_model).get('token_limit'))
                        except:
                            _max_token_limit = default_max_token_limit

                        try:
                            _max_out_token_limit = int(conf.get(llm_model).get('max_output_tokens'))
                        except:
                            _max_out_token_limit = default_max_output_tokens

                        try:
                            _delay = int(conf.get(llm_model).get('delay'))
                        except:
                            _delay = default_delay

                        try:
                            _temperature = float(conf.get(llm_model).get('temperature'))
                        except:
                            _temperature = default_temperature

                        try:
                            _top_k = int(conf.get(llm_model).get('top_k'))
                        except:
                            _top_k = default_top_k

                        try:
                            _top_p = float(conf.get(llm_model).get('top_p'))
                        except:
                            _top_p = default_top_p

                        break
                except Exception as ex:
                    pass

        except yaml.YAMLError as ex:
            raise Exception(ex)

        if _llm_model is None:
            raise Exception(f'Error: model "{llm_model}" is not in the Config.yaml list!')

        _LLM_API_Key = LLM_API_Key(api_config_path=api_config_path)
        load_rules(rules_path=rules_path)

        if workload_path is not None:
            load_workload_queries(workload_path=workload_path)

        if template_path is not None:
            load_workload_templates(template_path=template_path)


def load_db_config(db_config_path: str = "DBConfig.yaml"):
    global _pgsql_user
    global _pgsql_password
    global _pgsql_host
    global _pgsql_port

    with open(db_config_path, "r") as f:
        try:
            configs = yaml.load(f, Loader=yaml.FullLoader)
            for conf in configs:
                plt = conf.get("database")
                if plt == "Postgres":
                    try:
                        _pgsql_user = conf.get("user")
                        _pgsql_password = conf.get("password")
                        _pgsql_host = conf.get("host")
                        _pgsql_port = conf.get("port")
                    except:
                        pass

        except yaml.YAMLError as ex:
            raise Exception(ex)


def load_db_queries(db_queries_path: str = "DBCatalogQueries.yaml"):
    global _query_table_list
    global _query_table_schema
    global _query_table_indexes
    global _query_table_FPK_FK
    global _query_table_profile
    global _query_table_cardinality
    global _query_central_table

    with open(db_queries_path, "r") as f:
        try:
            configs = yaml.load(f, Loader=yaml.FullLoader)
            for conf in configs:
                plt = conf.get("database")
                if plt == "Postgres":
                    try:
                        _query_table_list = conf.get("table_list")
                        _query_table_schema = conf.get("table_schema")
                        _query_table_indexes = conf.get("table_indexes")
                        _query_table_FPK_FK = conf.get("table_PK_FK")
                        _query_table_profile = conf.get("table_profile")
                        _query_table_cardinality = conf.get("table_cardinality")
                        _query_central_table = conf.get("central_table")
                    except:
                        pass

        except yaml.YAMLError as ex:
            raise Exception(ex)


def load_rules(rules_path: str):
    global _implement_task
    global _setting_rules
    global _rules
    global _verify
    global _CODE_BLOCK
    global _DATASET_DESCRIPTION

    with (open(rules_path, "r") as f):
        try:
            configs = yaml.load(f, Loader=yaml.FullLoader)
            for conf in configs:
                plt = conf.get("Config")
                if plt != 'CodeFormat':
                    rls = dict()
                    for k, v in conf.items():
                        rls[k] = v
                        if plt == "Implement":
                            if k in {"Task","Input","Output"}:
                                _implement_task[k] = rls[k]
                        elif plt == "Setting":
                            _setting_rules = rls
                        elif plt in {"General", "Aggregation", "Filter", "Join", "Project", "Calc", "Union",
                                     "With"} and k == "Rules":
                            _rules[plt] = rls["Rules"]
                        elif plt == "Verify":
                            if k in {"Description","Input","Task", "Instructions", "Output", "Notes"}:
                                _verify[k] = rls[k]
                else:
                    for k, v in conf.items():
                        if k == 'CODE_BLOCK':
                            _CODE_BLOCK = v
                        elif k == 'DATASET_DESCRIPTION':
                            _DATASET_DESCRIPTION = v
        except yaml.YAMLError as ex:
            raise Exception(ex)


def load_workload_queries(workload_path: str):
    global _workload
    for path, subdirs, files in os.walk(workload_path):
        for name in files:
            if name.endswith(".sql"):
                head, tail = os.path.split(name)
                fname = os.path.join(path, name)
                query = read_text_file_line_by_line(fname)
                if "SELECT" in query or "select" in query:
                    _workload.append((query, tail))
    return _workload

# def load_workload_templates(template_path: str):
#     global _templates
#     tmp_template = dict()
#     for path, subdirs, files in os.walk(template_path):
#         for name in files:
#             if name.endswith(".sql"):
#                 head, tail = os.path.split(name)
#                 fname = os.path.join(path, name)
#                 template = read_text_file_line_by_line(fname)
#                 template_name = tail.replace(".sql",'')
#                 tmp_template[template_name] = template
#
#     for tid in range(0,len(tmp_template)):
#         template_name = f"Template_{tid+1}"
#         template = tmp_template[template_name]
#         _templates.append((template, template_name))
#
#     return _templates

def load_workload_templates(template_path: str):
    global _templates
    for path, subdirs, files in os.walk(template_path):
        for name in files:
            if name.endswith(".sql"):
                head, tail = os.path.split(name)
                fname = os.path.join(path, name)
                template = read_text_file_line_by_line(fname)
                _templates.append((template, tail.replace(".sql",'')))

    return _templates


def load_template_rewrites(template_path, rewrite_path: str):
    global _templates_versions
    global _templates_versions_IDS
    implement_funcs = dict()
    implement_funcs_str = dict()
    templates = dict()
    rewrite_names = []

    for path, subdirs, files in os.walk(template_path):
        for name in files:
            if name.endswith(".sql"):
                head, tail = os.path.split(name)
                fname = os.path.join(path, name)
                template = read_text_file_line_by_line(fname)
                template_name = tail.replace(".sql",'')
                templates[template_name] = template
                _templates_versions_IDS[template_name] = []

    for path, subdirs, files in os.walk(rewrite_path):
        for name in files:
            if  name.endswith(".sql") and not name.endswith("-list.sql") and not name.endswith("-0.sql"):
                head, tail = os.path.split(name)
                rewrite_names.append(tail.replace(".sql",''))
            elif name.endswith("-0.sql"):
                implement_funcs[name.replace("-0.sql",'')] = ""

    for tk in templates.keys():
        _templates_versions[templates[tk]] = []
        for rname in rewrite_names:
            if f"{tk}-" in rname:
                fname = os.path.join(rewrite_path, f"{rname}.sql")
                version = read_text_file_line_by_line(fname, ignore_comments=True, comment_tag='--')
                version = version.replace("'&&&'","&&&")
                _templates_versions[templates[tk]].append(version)

                version_id = rname.replace(f"{tk}-","")
                _templates_versions_IDS[tk].append((version_id,version))
        if tk in implement_funcs.keys():
            fname = os.path.join(rewrite_path, f"{tk}-0.sql")
            funcs = read_text_file_line_by_line(fname, ignore_comments=False, comment_tag='')
            implement_funcs_str[templates[tk]] = funcs
    return _templates_versions, _templates_versions_IDS, implement_funcs_str