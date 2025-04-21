import os

class PropertyUtil:
    @staticmethod
    def get_property_string():
        props = {}
        file_path = os.path.join(os.path.dirname(__file__), '../resources/db.properties')
        try:
            with open(file_path, 'r') as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#'):
                        key_value = line.split('=')
                        if len(key_value) == 2:
                            key, value = key_value
                            props[key.strip()] = value.strip()
        except FileNotFoundError:
            print("Property file not found.")
            return None

        # Build the connection string for trusted connection
        connection_string = (
            f"DRIVER={{SQL Server}};"
            f"SERVER={props.get('server')};"
            f"DATABASE={props.get('database')};"
            f"Trusted_Connection={props.get('trusted_connection')};"
        )
        return connection_string
