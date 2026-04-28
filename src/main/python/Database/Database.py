import psycopg2
import duckdb


class PostgreDB:

    @staticmethod
    def connect():
        from util.Config import _dataset_name, _pgsql_user, _pgsql_password, _pgsql_host, _pgsql_port
        conn = psycopg2.connect(database=_dataset_name, user=_pgsql_user, password=_pgsql_password,
                                host=_pgsql_host, port=_pgsql_port, )
        return conn, conn.cursor()

    @staticmethod
    def connect_by_params(dataset_name):
        from util.Config import _pgsql_user, _pgsql_password, _pgsql_host, _pgsql_port
        conn = psycopg2.connect(database=dataset_name, user=_pgsql_user, password=_pgsql_password,
                                host=_pgsql_host, port=_pgsql_port, )
        return conn, conn.cursor()

    @staticmethod
    def close_connect(conn, cursor):
        cursor.close()
        conn.close()

    @staticmethod
    def execute(cursor, query):
        cursor.execute(query)
        result = cursor.fetchall()
        return result


class DuckDB:

    @staticmethod
    def connect():
        from util.Config import _dataset_name, _database_path
        conn = duckdb.connect(f"{_database_path}/{_dataset_name}.duckdb")  # ,config = {'threads': 1}
        return conn

    @staticmethod
    def close_connect(conn):
        conn.close()

    @staticmethod
    def execute(conn, query):
        result = conn.execute(query).fetchdf()
        return result
