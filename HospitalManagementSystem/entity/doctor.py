class Doctor:
    def __init__(self, doctor_id=None, first_name='', last_name='', specialization='', contact_number=''):
        self.__doctor_id = doctor_id
        self.__first_name = first_name
        self.__last_name = last_name
        self.__specialization = specialization
        self.__contact_number = contact_number

    def get_doctor_id(self):
        return self.__doctor_id

    def set_doctor_id(self, value):
        self.__doctor_id = value

    def get_first_name(self):
        return self.__first_name

    def set_first_name(self, value):
        self.__first_name = value

    def get_last_name(self):
        return self.__last_name

    def set_last_name(self, value):
        self.__last_name = value

    def get_specialization(self):
        return self.__specialization

    def set_specialization(self, value):
        self.__specialization = value

    def get_contact_number(self):
        return self.__contact_number

    def set_contact_number(self, value):
        self.__contact_number = value

    def __str__(self):
        return (
            f"Doctor[ID={self.__doctor_id}, Name={self.__first_name} {self.__last_name}, "
            f"Specialization={self.__specialization}, Contact={self.__contact_number}]"
        )
