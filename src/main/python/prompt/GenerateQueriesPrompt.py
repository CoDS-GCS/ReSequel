from .BasicPrompt import BasicPrompt


class GenerateQueriesPrompt(BasicPrompt):

    def __init__(self,list_size: int, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.list_size = list_size

    def format_system_message(self):
        from util.Config import _setting_rules, _implement_task, _rules, _system_delimiter, _dbms
        rules = [f"{_system_delimiter} Task: {_setting_rules['Task'].format(_dbms)}",
                 f"{_system_delimiter} Function Implementation Task: {_implement_task['Task'].format(_dbms)}",
                 f"{_system_delimiter} Input: {_setting_rules['Input']}",
                 f"{_system_delimiter} Output:{_setting_rules['OutputList'].format(self.list_size)}",
                 f"\n{_system_delimiter} General Optimization Guidelines:",
                 _rules["General"].format(_dbms)]

        for kr in self.get_rules():
            rules.append(f"\n{_system_delimiter} Optimization Guidelines {kr}:\n{_rules[kr]}")

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

        content.append(f"SQL Query Template Requested for Optimization:\n{self.template}")
        content.append("**Important Rule**: Never replace masked or placeholder values (e.g., :###, &&&, or ^^^) with actual values. These placeholders will be filled after query generation. Focus only on the correct SQL structure using placeholders.")
        return f"\n{_user_delimiter}".join(content)