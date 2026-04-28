from .BasicPrompt import BasicPrompt


class ImplementPrompt(BasicPrompt):

    def __init__(self, table_name: str, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.table_name = table_name

    def format_system_message(self):
        from util.Config import _implement_task, _system_delimiter, _dbms
        rules = [f"{_system_delimiter} Task: {_implement_task['Task'].format(_dbms)}",
                 f"{_system_delimiter} Input: {_implement_task['Input']}",
                 f"{_system_delimiter} Output:{_implement_task['Output']}"]
        return "\n".join(rules)

    def format_user_message(self):
        from util.Config import _user_delimiter

        content = [f"{_user_delimiter} Given the following database schema and catalog info:"]

        relation_tables = self._get_all_tables_in_relation()
        for tbl in self.catalog.table_names:
            if tbl.lower() in relation_tables:
                content.append(self.get_table_schema(table_name=tbl, columns=['*']))

        content.append(f'Implement Functions for Table "{self.table_name}".')

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

    def _get_all_tables_in_relation(self):
        tables = []
        if len(self.catalog.table_names) == 1:
            tables = [self.table_name]
            return tables
        else:
            dependency = self.catalog.dependency[self.table_name]
            if len(dependency["foreign_key"]) > 0:
                for fk in dependency["foreign_key"]:
                    tables.append(fk["foreign_table_name"])

            for tbl in self.catalog.table_names:
                if tbl not in tables:
                    dependency = self.catalog.dependency[tbl]
                    if len(dependency["foreign_key"]) > 0:
                        for fk in dependency["foreign_key"]:
                            if self.table_name == tables.append(fk["foreign_table_name"]):
                                tables.append(tbl)
                                break
        return tables
