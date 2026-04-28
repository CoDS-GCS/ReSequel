from argparse import ArgumentParser
from Config import load_config
from Verify_main import VerifyPG, VerifyDuckDB, VerifyMySQL


def parse_arguments():
    parser = ArgumentParser()
    parser.add_argument('--workload-path', type=str, default="/tmp/")
    parser.add_argument('--database-name', type=str, default="test")
    parser.add_argument('--database-path', type=str, default="test.duckdb")
    parser.add_argument('--dbms', type=str, default="PostgreSQL")
    parser.add_argument('--runner-dbms', type=str, default="PostgreSQL")
    parser.add_argument('--rewrite-path', type=str, default="/tmp/")
    parser.add_argument('--output-path-verify', type=str, default="/tmp/")
    parser.add_argument('--output-path-select', type=str, default="/tmp/")
    parser.add_argument('--verify-log-path', type=str, default="/tmp/query-verify.log")

    args = parser.parse_args()
    return args


if __name__ == '__main__':
    args = parse_arguments()
    load_config(dbms=args.dbms, dataset_name=args.database_name, workload_path=args.workload_path, database_path=args.database_path)
    from Config import _work_load

    workload_dbms = None
    if args.runner_dbms == "PostgreSQL":
        workload_dbms = VerifyPG

    elif args.runner_dbms == "DuckDB":
        workload_dbms = VerifyDuckDB

    elif args.runner_dbms == "MySQL":
        workload_dbms = VerifyMySQL

    verify = workload_dbms(workload_path=args.workload_path, queries=_work_load, database_name=args.database_name,
                          dbms=args.dbms, rewrite_path=args.rewrite_path, output_path_verify=args.output_path_verify,
                          output_path_select=args.output_path_select, verify_log_path=args.verify_log_path)

    verify.run()
