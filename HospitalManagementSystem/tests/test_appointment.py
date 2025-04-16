from entity.appointment import Appointment

def test_create_appointment():
    appointment = Appointment(301, 101, 201, "2025-04-20", "Routine check")
    assert appointment.get_patient_id() == 101
    assert appointment.get_description() == "Routine check"
