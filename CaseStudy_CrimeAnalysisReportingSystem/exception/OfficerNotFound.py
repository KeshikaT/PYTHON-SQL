class OfficerNotFoundException(Exception):
    def __init__(self, officer_id):
        super().__init__(f"Officer with ID {officer_id} not found in the database.")
