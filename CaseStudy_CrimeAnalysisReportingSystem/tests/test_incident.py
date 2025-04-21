import pytest
import datetime
from entity.Incident import Incident
from dao.CrimeAnalysisServiceImpl import CrimeAnalysisServiceImpl
from exception.IncidentNotFound import IncidentNumberNotFoundException

@pytest.fixture
def sample_incident():
    # Using a unique ID to avoid conflicts
    return Incident(
        incident_id=9999,
        incident_type="Robbery",
        incident_date=datetime.date(2023, 5, 1),
        location_latitude=12.9716,
        location_longitude=77.5946,
        description="Test robbery case",
        status="Open",
        victim_id=1,
        suspect_id=2,
        officer_id=3
    )

def test_create_incident(sample_incident):
    service = CrimeAnalysisServiceImpl()
    cursor = service.connection.cursor()

    # Clean up before test
    cursor.execute("DELETE FROM Incidents WHERE IncidentID = ?", (sample_incident.get_incident_id(),))
    service.connection.commit()

    # Insert and verify
    assert service.create_incident(sample_incident) is True

    # Clean up after test
    cursor.execute("DELETE FROM Incidents WHERE IncidentID = ?", (sample_incident.get_incident_id(),))
    service.connection.commit()

def test_incident_attribute_check(sample_incident):
    assert sample_incident.get_status() == "Open"
    assert sample_incident.get_incident_type() == "Robbery"

def test_invalid_incident_status_update():
    service = CrimeAnalysisServiceImpl()
    with pytest.raises(IncidentNumberNotFoundException):
        service.get_incident_by_id(999999)
