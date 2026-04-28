from sql_metadata import Parser


class BasicPrompt(object):
    def __init__(self, *args, **kwargs):
        pass

    def format(self):
        return {
            "system_message": self.format_system_message(),
            "user_message": self.format_user_message()
        }

    def format_system_message(self):
        from util.Config import _setting_rules, _implement_task, _rules, _system_delimiter, _dbms
        rules = [f"{_system_delimiter} Task: {_setting_rules['Task'].format(_dbms)}",
                 f"{_system_delimiter} Function Implementation Task: {_implement_task['Task'].format(_dbms)}",
                 f"{_system_delimiter} Input: {_setting_rules['Input']}",
                 f"{_system_delimiter} Output:{_setting_rules['Output']}",
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
        content.append(f"Question: Optimize the query template and return only NEW SQL high performance query.")

        return f"\n{_user_delimiter}".join(content)

    def get_table_schema(self, table_name: str, columns: []):
        schema_table_template = "TABLE {} (\n{}{}\n){};"
        schema_col_template = "{} {} {} {}"

        schema_cols = []
        profile = self.catalog.profile[table_name]
        dependency = self.catalog.dependency[table_name]
        for col in self.catalog.schema[table_name]:
            col_name = f'{col["name"]}'
            col_data_type = col["type"]
            if col_name in dependency["primary_key"]:
                primary_key = "PRIMARY KEY"
            else:
                primary_key = ""
            col_profile = []
            for k in profile[col_name].keys():
                col_profile.append(f"{k}:[{profile[col_name][k]}]")
            col_profile = " ".join(col_profile)
            schema_col = schema_col_template.format(f"\t'{col_name}'", col_data_type, primary_key, col_profile)
            schema_cols.append(schema_col)

        foreign_keys = ""
        if len(dependency["foreign_key"]) > 0:
            fks = []
            fk_template = "foreign key ( '{}' ) references '{}' ( '{}' )"
            for fk in dependency["foreign_key"]:
                fks.append(fk_template.format(fk["column_name"], fk["foreign_table_name"], fk["foreign_column_name"]))
            foreign_keys = "\n".join(fks)
            foreign_keys = f"\n{foreign_keys}"
        indexes = ""
        if len(self.catalog.table_indexes[table_name]) > 0:
            indexes = ",".join(self.catalog.table_indexes[table_name])
        return schema_table_template.format(table_name, ",\n".join(schema_cols), f"{foreign_keys}",
                                            f"Indexes: {indexes}")

    def get_workload_tables_columns(self):
        tables = []
        columns = ["*"]
        parser = Parser(self.template)
        tables.extend(parser.tables)
        return set(tables), set(columns)

    def get_rules(self):
        from util.Config import _rules
        selected_rules = dict()

        if "join" in self.template.lower():
            selected_rules['Join'] = _rules['Join']

        if "group by" in self.template.lower():
            selected_rules['Aggregation'] = _rules['Aggregation']

        if "union" in self.template.lower():
            selected_rules['Union'] = _rules['Union']

        if "with" in self.template.lower():
            selected_rules['With'] = _rules['With']

        selected_rules['Filter'] = _rules['Filter']
        selected_rules['Project'] = _rules['Project']
        selected_rules['Calc'] = _rules['Calc']

        return selected_rules