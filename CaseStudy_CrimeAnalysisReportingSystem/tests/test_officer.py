import pytest
from dao.CrimeAnalysisServiceImpl import CrimeAnalysisServiceImpl
from exception.OfficerNotFound import OfficerNotFoundException

def test_officer_not_found_exception():
    service = CrimeAnalysisServiceImpl()
    with pytest.raises(OfficerNotFoundException):
        service.get_officer_by_id(9999)  # ID not present
