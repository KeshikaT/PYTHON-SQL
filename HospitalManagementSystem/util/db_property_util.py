class PropertyUtil:
    @staticmethod
    def get_property_string():
        props = {}
        try:
            with open("main/db_config.properties", "r") as file:
                for line in file:
                    if "=" in line and not line.startswith("#"):
                        key, value = line.strip().split("=", 1)
                        props[key.strip()] = value.strip()
        except FileNotFoundError:
            print("Property file not found!")

        # Building connection string for trusted connection (Windows Auth)
        connection_string = (
            f"DRIVER={{SQL Server}};"
            f"SERVER={props.get('hostname')};"
            f"DATABASE={props.get('dbname')};"
            f"Trusted_Connection={props.get('trusted_connection')};"
        )
        return connection_string
