import pytest
from dao.CrimeAnalysisServiceImpl import CrimeAnalysisServiceImpl
from exception.CaseNotFound import CaseNotFoundException

def test_case_not_found_exception():
    service = CrimeAnalysisServiceImpl()
    with pytest.raises(CaseNotFoundException):
        service.get_case_by_id(9999)  # Non-existent case
