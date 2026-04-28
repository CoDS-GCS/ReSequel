from .BasicPrompt import BasicPrompt


class VerifyQueriesPrompt(BasicPrompt):

    def __init__(self,queries: [], template, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.queries = queries
        self.template = template

    def format_system_message(self):
        from util.Config import _verify, _system_delimiter, _dbms
        rules = [f"{_system_delimiter} {_verify['Description'].format(_dbms)}",
                 f"{_system_delimiter} Input: {_verify['Input']}",
                 f"{_system_delimiter} Task: {_verify['Task']}",
                 f"{_system_delimiter} Instructions:{_verify['Instructions']}",
                 f"{_system_delimiter} Output:{_verify['Output']}",
                 f"{_system_delimiter} Notes:{_verify['Notes']}"]

        return "\n".join(rules)

    def format_user_message(self):
        from util.Config import _user_delimiter
        content = [f"{_user_delimiter} Given the following database schema and catalog info:"]

        workload_tables, workload_columns = self.get_workload_tables_columns()
        workload_tables = [t.lower() for t in workload_tables]
        workload_columns = [t.lower() for t in workload_columns]

        tbls = self.catalog.table_names
        for tbl in tbls:
            if tbl.lower() in workload_tables:
                content.append(self.get_table_schema(table_name=tbl, columns=workload_columns))

        content.append(f"SQL Query Template:\n{self.template}")
        ql = []
        for (qk, sql) in self.queries:
            ql.append(f"#QUERY {qk}: {sql}")

        ql = f"\n".join(ql)
        content.append(f"List of Rewrite Queries for Equal Check:\n{ql}")
        return f"\n{_user_delimiter}".join(content)