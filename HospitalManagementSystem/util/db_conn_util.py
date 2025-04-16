import pyodbc
from util.db_property_util import PropertyUtil

class DBConnection:
    connection = None

    @staticmethod
    def get_connection():
        if DBConnection.connection is None:
            try:
                conn_str = PropertyUtil.get_property_string()
                DBConnection.connection = pyodbc.connect(conn_str)
                print("Database connection established successfully.")
            except Exception as e:
                print("Database connection failed:", e)
        return DBConnection.connection
