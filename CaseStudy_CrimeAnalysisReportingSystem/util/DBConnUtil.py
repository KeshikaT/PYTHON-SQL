import pyodbc
from util.DBPropertyUtil import PropertyUtil

class DBConnUtil:
    connection = None

    @staticmethod
    def get_connection():
        if DBConnUtil.connection is None:
            try:
                conn_str = PropertyUtil.get_property_string()
                if conn_str is None:
                    raise Exception("Connection string is empty.")
                DBConnUtil.connection = pyodbc.connect(conn_str)
                print("Connection established.")
            except Exception as e:
                print("Failed to connect to database:", e)
        return DBConnUtil.connection
