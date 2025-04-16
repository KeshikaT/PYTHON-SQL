class Appointment:
    def __init__(self, appointment_id=None, patient_id=None, doctor_id=None, appointment_date=None, description=''):
        self.__appointment_id = appointment_id
        self.__patient_id = patient_id
        self.__doctor_id = doctor_id
        self.__appointment_date = appointment_date
        self.__description = description

    def get_appointment_id(self):
        return self.__appointment_id

    def set_appointment_id(self, value):
        self.__appointment_id = value

    def get_patient_id(self):
        return self.__patient_id

    def set_patient_id(self, value):
        self.__patient_id = value

    def get_doctor_id(self):
        return self.__doctor_id

    def set_doctor_id(self, value):
        self.__doctor_id = value

    def get_appointment_date(self):
        return self.__appointment_date

    def set_appointment_date(self, value):
        self.__appointment_date = value

    def get_description(self):
        return self.__description

    def set_description(self, value):
        self.__description = value

    def __str__(self):
        return (
            f"Appointment[ID={self.__appointment_id}, PatientID={self.__patient_id}, "
            f"DoctorID={self.__doctor_id}, Date={self.__appointment_date}, Description={self.__description}]"
        )
