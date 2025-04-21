class CaseNotFoundException(Exception):
    def __init__(self, case_id):
        super().__init__(f"Case with ID {case_id} not found in the database.")
