from argparse import ArgumentParser
from util.Config import load_config_catalog, load_config_system, load_workload_templates
from llm.OptimizeSQL import optimize_and_verify_queries, generate_queries, verify_queries
from util.FileHandler import save_text_file
from util.LogResults import LogTemplateResults
import time
import sqlparse


def parse_arguments():
    parser = ArgumentParser()
    parser.add_argument('--dataset-name', type=str, default=None)
    parser.add_argument('--prepare-data-catalog', help='Prepare Data Catalog', action='store_true')
    parser.add_argument('--implement', help='Implement Database Functions', action='store_true')
    parser.add_argument('--templatization', help='Extract Query Template', action='store_true')
    parser.add_argument('--query-list', help='Generate a list of queries', action='store_true')
    parser.add_argument('--reconstruct', help='Generate a list of queries', action='store_true')
    parser.add_argument('--judge', help='Verify LLM queries', action='store_true')
    parser.add_argument('--downsampling', help='Downsample Database', action='store_true')
    parser.add_argument('--db-schema', type=str, default="schema.json")
    parser.add_argument('--list-size', type=int, default=10)
    parser.add_argument('--llm-model', type=str, default=None)
    parser.add_argument('--catalog-path', type=str, default=None)
    parser.add_argument('--system-log', type=str, default="/tmp/cat-system-log.dat")
    parser.add_argument('--output-path', type=str, default="/tmp/results.csv")
    parser.add_argument('--result-log-path', type=str, default="/tmp/results-log.csv")
    parser.add_argument('--workload-path', type=str, default=None)
    parser.add_argument('--template-path', type=str, default=None)
    parser.add_argument('--template-rewrite-path', type=str, default=None)
    parser.add_argument('--query-ID', type=str, default=None)
    parser.add_argument('--workload-output', type=str, default="/tmp/")
    parser.add_argument('--dbms', type=str, default="postgresql")
    parser.add_argument('--sample-fraction', type=int, default=1)


    args = parser.parse_args()
    if args.dataset_name is None:
        raise Exception("--dataset-name is a required parameter!")

    return args

def format_sql(query: str) -> str:
    formatted = sqlparse.format(
        query,
        reindent=True,
        keyword_case='upper'  # Options: 'upper', 'lower', 'capitalize'
    )
    return formatted

def extract_queries(query_text:str, list_size:int):
    queries = []
    begin_points = []
    begin_pos = []
    end_points = []

    for i in range(1, list_size+1):
        bpos = query_text.find(f"-- Query#{i}:")
        if bpos == -1:
            bpos = query_text.find(f"Query#{i}:")
            begin_pos.append(len(f"Query#{i}:"))

        else:
            begin_pos.append(0)
        begin_points.append(bpos)

    for i in range(1, list_size):
        end_points.append(begin_points[i])
    end_points.append(len(query_text))

    for i in range(0, list_size):
        queries.append(format_sql(query_text[begin_points[i]+begin_pos[i]:end_points[i]]))
    return queries

if __name__ == '__main__':
    args = parse_arguments()

    load_config_catalog(dataset_name=args.dataset_name, dbms=args.dbms)

    # Build catalog
    if args.prepare_data_catalog:
        from catalog.Catalog import build_database_catalog_mthread
        time_start = time.time()
        catalog = build_database_catalog_mthread(save_path=args.catalog_path)
        time_end = time.time()
        time_catalog = time_end - time_start

    # Build workload template
    elif args.templatization:
        from util.Config import load_workload_queries

        load_workload_queries(workload_path=args.workload_path)
        from runquery.Templatizer_compile import SQLTemplateManager
        from util.Config import _workload


        manager = SQLTemplateManager()
        template_log = dict()

        for (query, q) in _workload:
           template_index, template, params = manager.find_or_add_template(query=query, qid=q, get_params=False)
           template_index += 1
           if template_index not in template_log:
               template_log[template_index] = [q]
           else:
               template_log[template_index].append(q)

        ltr = LogTemplateResults()
        for tlog in template_log.keys():
            ltr.add_result(tlog, template_log[tlog])
        templates, templates_IDS, _ = manager.get_templates()
        for index, template in enumerate(templates):
            fname = f"{args.workload_output}/Template_{index + 1}.sql"
            save_text_file(fname=fname, data=template)

    # Reconstruct queries based on template
    elif args.reconstruct:
        from runquery.Templatizer_compile import SQLTemplateManager
        from util.Config import load_workload_queries, load_template_rewrites

        queries =  load_workload_queries(workload_path=args.workload_path)
        template_versions,_, implement_func = load_template_rewrites(rewrite_path=args.template_rewrite_path, template_path=args.template_path)

        manager = SQLTemplateManager(template_versions=template_versions)
        for (query, q) in queries:
            #if q in selected_qids:
                new_queries, query_template = manager.reconstruct_query(query=query)
                query_name = q.replace(".sql", "")
                orig_query_index = 1
                if new_queries is not None and len(new_queries) > 0:
                    for index, new_query in enumerate(new_queries):
                        fname =f"{args.workload_output}/{query_name}-{index+1}.sql"
                        save_text_file(fname=fname, data=new_query)
                    orig_query_index = len(new_queries) +1
                # move implemented functions
                if query_template in implement_func:
                    fname = f"{args.workload_output}/{query_name}-0.sql"
                    save_text_file(fname=fname, data=implement_func[query_template])
                # add original query into the candidate list
                fname = f"{args.workload_output}/{query_name}-{orig_query_index}.sql"
                save_text_file(fname=fname, data=query)

    # Verify rewrite queries with template
    elif args.judge:
        from catalog.Catalog import load_catalog
        from util.Config import load_workload_templates, load_template_rewrites

        load_config_system(system_log=args.system_log, llm_model=args.llm_model, rules_path="Rules.yaml",
                           template_path=args.template_path)
        from util.Config import _templates as query_templates

        time_start = time.time()
        catalog = load_catalog(catalog_path=args.catalog_path)
        time_end = time.time()
        time_catalog = time_end - time_start

        _, template_version_IDs, _ = load_template_rewrites(rewrite_path=args.template_rewrite_path, template_path=args.template_path)

        for (template, tid) in query_templates:
          verfied_queries = verify_queries(llm_model=args.llm_model, template_id= tid, result_log_path=args.result_log_path, catalog=catalog,
                          template=template, queries=template_version_IDs[tid], log_name=tid, time_catalog=time_catalog,
                          output_path=args.output_path)
          if len(verfied_queries) > 0:
              for (qk, sql) in template_version_IDs[tid]:
                  if qk in verfied_queries:
                    save_text_file(fname=f"{args.workload_output}/{tid}-{qk}.sql", data=sql)

        # Verify rewrite templates with database samples
    elif args.downsampling:
        from catalog.Catalog import load_catalog
        from verify.Downsampling import Downsampling

        load_config_system(system_log=args.system_log, llm_model=args.llm_model, rules_path="Rules.yaml",
                           template_path=args.template_path)
        catalog = load_catalog(catalog_path=args.catalog_path)
        from util.Config import _templates as query_templates
        ds = Downsampling(templates=query_templates, catalog=catalog, sample_fraction=args.sample_fraction)
        ds.do_downsampling()

    else:
        from catalog.Catalog import load_catalog

        load_config_system(system_log=args.system_log, llm_model=args.llm_model, rules_path="Rules.yaml",
                           template_path=args.template_path)

        time_start = time.time()
        catalog = load_catalog(catalog_path=args.catalog_path)
        time_end = time.time()
        time_catalog = time_end - time_start

        if args.implement:
            from llm.ImplementFunction import implement_function
            implement_function(llm_model=args.llm_model, output_path=args.output_path, catalog=catalog,
                                     log_name="ImplementFunctions", time_catalog=time_catalog, result_log_path=args.result_log_path)

        # Rewrite queries (generate query list)
        elif args.query_list:
            from util.Config import _templates
            for (template, tid) in _templates:
                for bi in [0,10,20]:
                    time.sleep(1)
                    new_sqls = generate_queries(llm_model=args.llm_model, output_path=args.output_path, catalog=catalog,
                                                template=template, log_name=f"Generate-Query-{tid}", time_catalog=time_catalog,
                                                result_log_path=args.result_log_path, list_size=args.list_size)
                    if new_sqls is not None:
                        save_text_file(fname=f"{args.workload_output}/{tid}-{bi}-list.sql", data=new_sqls)
                        l = extract_queries(new_sqls, args.list_size)
                        for index, query in enumerate(l):
                            save_text_file(fname=f"{args.workload_output}/{tid}-{bi+index+1}.sql", data=query)