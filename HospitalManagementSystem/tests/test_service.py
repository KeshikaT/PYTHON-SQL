import sys
import os
import pytest

# Ensure project root is in the import path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from dao.Hosp_serv_impl import HospitalServiceImpl
from exceptions.patient_notfound import PatientNumberNotFoundException

hospital_service = HospitalServiceImpl()

def test_get_valid_appointment():
    appointment = hospital_service.get_appointment_by_id(301)
    assert appointment is not None
    assert appointment.get_patient_id() == 101

def test_invalid_patient_raises_exception():
    with pytest.raises(PatientNumberNotFoundException):
        hospital_service.get_appointments_for_patient(9999)
