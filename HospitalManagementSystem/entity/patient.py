class Patient:
    def __init__(self, patient_id=None, first_name='', last_name='', date_of_birth=None,
                 gender='', contact_number='', address=''):
        self.__patient_id = patient_id
        self.__first_name = first_name
        self.__last_name = last_name
        self.__date_of_birth = date_of_birth
        self.__gender = gender
        self.__contact_number = contact_number
        self.__address = address

    def get_patient_id(self):
        return self.__patient_id

    def set_patient_id(self, value):
        self.__patient_id = value

    def get_first_name(self):
        return self.__first_name

    def set_first_name(self, value):
        self.__first_name = value

    def get_last_name(self):
        return self.__last_name

    def set_last_name(self, value):
        self.__last_name = value

    def get_date_of_birth(self):
        return self.__date_of_birth

    def set_date_of_birth(self, value):
        self.__date_of_birth = value

    def get_gender(self):
        return self.__gender

    def set_gender(self, value):
        self.__gender = value

    def get_contact_number(self):
        return self.__contact_number

    def set_contact_number(self, value):
        self.__contact_number = value

    def get_address(self):
        return self.__address

    def set_address(self, value):
        self.__address = value

    def __str__(self):
        return (
            f"Patient[ID={self.__patient_id}, Name={self.__first_name} {self.__last_name}, "
            f"DOB={self.__date_of_birth}, Gender={self.__gender}, "
            f"Contact={self.__contact_number}, Address={self.__address}]"
        )
