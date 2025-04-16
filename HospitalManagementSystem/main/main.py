
from entity.appointment import Appointment
from dao.Hosp_serv_impl import HospitalServiceImpl
from exceptions.patient_notfound import PatientNumberNotFoundException


def display_appointment(appointment: Appointment):
    print(f"ID: {appointment.get_appointment_id()}")
    print(f"Patient ID: {appointment.get_patient_id()}")
    print(f"Doctor ID: {appointment.get_doctor_id()}")
    print(f"Date: {appointment.get_appointment_date()}")
    print(f"Description: {appointment.get_description()}")


def main():
    hospital_service = HospitalServiceImpl()

    while True:
        print("\n=== Hospital Appointment Management System ===")
        print("1. Get Appointment By ID")
        print("2. Get Appointments For Patient")
        print("3. Get Appointments For Doctor")
        print("4. Schedule Appointment")
        print("5. Update Appointment")
        print("6. Cancel Appointment")
        print("7. Show All Appointments")
        print("8. Exit")

        choice = input("Enter your choice (1-8): ").strip()

        try:
            if choice == '1':
                appointment_id = int(input("Enter Appointment ID: "))
                appointment = hospital_service.get_appointment_by_id(appointment_id)
                if appointment:
                    print("Appointment Details:")
                    display_appointment(appointment)
                else:
                    print("Appointment not found.")

            elif choice == '2':
                patient_id = int(input("Enter Patient ID: "))
                appointments = hospital_service.get_appointments_for_patient(patient_id)
                for a in appointments:
                    display_appointment(a)

            elif choice == '3':
                doctor_id = int(input("Enter Doctor ID: "))
                appointments = hospital_service.get_appointments_for_doctor(doctor_id)
                if appointments:
                    for app in appointments:
                        display_appointment(app)
                else:
                    print("No appointments found for this doctor.")

            elif choice == '4':
                appointment_id = int(input("Enter Appointment ID: "))
                patient_id = int(input("Enter Patient ID: "))
                doctor_id = int(input("Enter Doctor ID: "))
                appointment_date = input("Enter Appointment Date (YYYY-MM-DD): ").strip()
                description = input("Enter Description: ").strip()

                appointment = Appointment(appointment_id, patient_id, doctor_id, appointment_date, description)
                success = hospital_service.schedule_appointment(appointment)
                print("Appointment scheduled successfully!" if success else "Failed to schedule appointment.")

            elif choice == '5':
                appointment_id = int(input("Enter Appointment ID to update: "))
                patient_id = int(input("Enter new Patient ID: "))
                doctor_id = int(input("Enter new Doctor ID: "))
                appointment_date = input("Enter new Appointment Date (YYYY-MM-DD): ").strip()
                description = input("Enter new Description: ").strip()

                appointment = Appointment(appointment_id, patient_id, doctor_id, appointment_date, description)
                success = hospital_service.update_appointment(appointment)
                print("Appointment updated successfully!" if success else "Failed to update appointment.")

            elif choice == '6':
                appointment_id = int(input("Enter Appointment ID to cancel: "))
                success = hospital_service.cancel_appointment(appointment_id)
                print("Appointment canceled successfully!" if success else "Failed to cancel appointment.")
            
            elif choice == '7':
                appointments = hospital_service.get_all_appointments()
                if appointments:
                    for app in appointments:
                        display_appointment(app)
                else:
                    print("No appointments found.")


            elif choice == '8':
                print("Exiting system. Goodbye!")
                break

            else:
                print("Invalid choice! Please enter a number between 1 and 7.")

        except ValueError:
            print("Invalid input. Please enter correct data types.")
        except PatientNumberNotFoundException as e:
            print(e)
        except Exception as e:
            print(f"Unexpected error: {e}")


if __name__ == "__main__":
    main()
