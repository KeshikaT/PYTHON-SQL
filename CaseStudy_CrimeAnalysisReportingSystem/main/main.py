from entity.Victim import Victim
from entity.Suspect import Suspect
from entity.Officer import Officer
from entity.Incident import Incident
from entity.Case import Case
from entity.Status import Status
from entity.IncidentType import IncidentType

from dao.CrimeAnalysisServiceImpl import CrimeAnalysisServiceImpl

from exception.IncidentNotFound import IncidentNumberNotFoundException
from exception.CaseNotFound import CaseNotFoundException
from exception.OfficerNotFound import OfficerNotFoundException

from datetime import datetime

service = CrimeAnalysisServiceImpl()

def add_victim():
    print("--- Add Victim ---")
    victim_id = int(input("Enter Victim ID: "))
    first_name = input("Enter First Name: ")
    last_name = input("Enter Last Name: ")
    dob = datetime.strptime(input("Enter Date of Birth (YYYY-MM-DD): "), "%Y-%m-%d").date()
    gender = input("Enter Gender: ")
    contact_info = input("Enter Contact Info: ")
    victim = Victim(victim_id, first_name, last_name, dob, gender, contact_info)
    if service.add_victim(victim):
        print("Victim added successfully.")
    else:
        print("Failed to add victim.")

def add_suspect():
    print("--- Add Suspect ---")
    suspect_id = int(input("Enter Suspect ID: "))
    first_name = input("Enter First Name: ")
    last_name = input("Enter Last Name: ")
    dob = datetime.strptime(input("Enter Date of Birth (YYYY-MM-DD): "), "%Y-%m-%d").date()
    gender = input("Enter Gender: ")
    contact_info = input("Enter Contact Info: ")
    suspect = Suspect(suspect_id, first_name, last_name, dob, gender, contact_info)
    if service.add_suspect(suspect):
        print("Suspect added successfully.")
    else:
        print("Failed to add suspect.")

def add_officer():
    print("--- Add Officer ---")
    officer_id = int(input("Enter Officer ID: "))
    first_name = input("Enter First Name: ")
    last_name = input("Enter Last Name: ")
    badge_number = input("Enter Badge Number: ")
    rank = input("Enter Rank: ")
    contact_info = input("Enter Contact Info: ")
    agency_id = int(input("Enter Agency ID: "))
    officer = Officer(officer_id, first_name, last_name, badge_number, rank, contact_info, agency_id)
    if service.add_officer(officer):
        print("Officer added successfully.")
    else:
        print("Failed to add officer.")

def create_incident():
    print("--- Create Incident ---")
    incident_id = int(input("Enter Incident ID: "))
    incident_type = input("Enter Incident Type: ")
    incident_date = datetime.strptime(input("Enter Incident Date (YYYY-MM-DD): "), "%Y-%m-%d").date()
    latitude = float(input("Enter Location Latitude: "))
    longitude = float(input("Enter Location Longitude: "))
    description = input("Enter Description: ")
    status = input("Enter Status: ")
    victim_id = int(input("Enter Victim ID: "))
    suspect_id = int(input("Enter Suspect ID: "))
    officer_id = int(input("Enter Officer ID: "))
    incident = Incident(incident_id, incident_type, incident_date, latitude, longitude, description, status, victim_id, suspect_id, officer_id)
    if service.create_incident(incident):
        print("Incident created successfully.")
    else:
        print("Failed to create incident.")

def update_incident_status():
    print("--- Update Incident Status ---")
    incident_id = int(input("Enter Incident ID: "))
    new_status = input("Enter New Status: ")
    status = Status(new_status)
    if service.update_incident_status(status, incident_id):
        print("Incident status updated.")
    else:
        print("Failed to update incident status.")

def get_incidents_by_date():
    print("\n--- Get Incidents by Date Range ---")
    try:
        start = input("Enter start date (YYYY-MM-DD): ")
        end = input("Enter end date (YYYY-MM-DD): ")
        
        incidents = service.get_incidents_in_daterange(start, end)
        
        if not incidents:
            print("No incidents found in the given date range.")
            return

        for inc in incidents:
            print(f"\nIncident ID   : {inc.get_incident_id()}")
            print(f"Type          : {inc.get_incident_type()}")
            print(f"Date          : {inc.get_incident_date()}")
            print(f"Latitude      : {inc.get_location_latitude()}")
            print(f"Longitude     : {inc.get_location_longitude()}")
            print(f"Status        : {inc.get_status()}")
            print(f"Victim ID     : {inc.get_victim_id()}")
            print(f"Suspect ID    : {inc.get_suspect_id()}")
            print(f"Officer ID    : {inc.get_officer_id()}")
    except Exception as e:
        print("Error retrieving incidents:", e)

def get_incidents_by_types():
    print("\n--- Search Incidents by Type ---")
    incident_type = input("Enter Incident Type: ")
    incidents = service.get_incidents_by_type(incident_type)
    
    if not incidents:
        print(f"No incidents found for type: {incident_type}")
        return

    for inc in incidents:
        print(f"\nIncident ID   : {inc.get_incident_id()}")
        print(f"Type          : {inc.get_incident_type()}")
        print(f"Date          : {inc.get_incident_date()}")
        print(f"Latitude      : {inc.get_location_latitude()}")
        print(f"Longitude     : {inc.get_location_longitude()}")
        print(f"Status        : {inc.get_status()}")
        print(f"Victim ID     : {inc.get_victim_id()}")
        print(f"Suspect ID    : {inc.get_suspect_id()}")
        print(f"Officer ID    : {inc.get_officer_id()}")

def get_incident_by_id():
    print("\n--- Get Incident by ID ---")
    try:
        incident_id = int(input("Enter Incident ID: "))
        incident = service.get_incident_by_id(incident_id)
        print(incident)
    except IncidentNumberNotFoundException as e:
        print("[Error]", e)
    except ValueError:
        print("[Error] Invalid input. Please enter a valid number.")
    except Exception as e:
        print("[Unexpected Error]", e)

def get_officer_by_id():
    print("--- Get Officer by ID ---")
    officer_id = int(input("Enter Officer ID: "))
    try:
        officer = service.get_officer_by_id(officer_id)
        print(f"Officer ID: {officer.get_officer_id()}")
        print(f"Name: {officer.get_first_name()} {officer.get_last_name()}")
        print(f"Badge: {officer.get_badge_number()}, Rank: {officer.get_rank()}")
        print(f"Contact Info: {officer.get_contact_info()}")
    except OfficerNotFoundException as e:
        print("Error:", e)

def get_case_by_id():
    print("--- Get Case by ID ---")
    case_id = int(input("Enter Case ID: "))
    try:
        case = service.get_case_by_id(case_id)
        print(f"Case ID: {case.get_case_id()}")
        print(f"Status: {case.get_case_status()}")
        print(f"Details: {case.get_case_details()}")
    except CaseNotFoundException as e:
        print("Error:", e)

def create_case():
    print("--- Create Case ---")
    case_id = int(input("Enter Case ID: "))
    incident_id = int(input("Enter Incident ID: "))
    victim_id = int(input("Enter Victim ID: "))
    suspect_id = int(input("Enter Suspect ID: "))
    officer_id = int(input("Enter Officer ID: "))
    case_status = input("Enter Case Status: ")
    case_details = input("Enter Case Details: ")
    case = Case(case_id, incident_id, victim_id, suspect_id, officer_id, case_status, case_details)
    if service.create_case(case):
        print("Case created successfully.")
    else:
        print("Failed to create case.")

def update_case_status():
    print("--- Update Case Status ---")
    case_id = int(input("Enter Case ID: "))
    new_status = input("Enter New Case Status: ")
    if service.update_case_status(case_id, new_status):
        print("Case status updated.")
    else:
        print("Failed to update case status.")

def view_all_victims():
    victims = service.get_all_victims()
    print("\n--- All Victims ---")
    for v in victims:
        print(f"\nVictim ID     : {v.get_victim_id()}")
        print(f"First Name    : {v.get_first_name()}")
        print(f"Last Name     : {v.get_last_name()}")
        print(f"Date of Birth : {v.get_date_of_birth()}")
        print(f"Gender        : {v.get_gender()}")
        print(f"Contact Info  : {v.get_contact_info()}")

def view_all_suspects():
    suspects = service.get_all_suspects()
    print("\n--- All Suspects ---")
    for s in suspects:
        print(f"\nSuspect ID    : {s.get_suspect_id()}")
        print(f"First Name    : {s.get_first_name()}")
        print(f"Last Name     : {s.get_last_name()}")
        print(f"Date of Birth : {s.get_date_of_birth()}")
        print(f"Gender        : {s.get_gender()}")
        print(f"Contact Info  : {s.get_contact_info()}")

def view_all_officers():
    officers = service.get_all_officers()
    print("\n--- All Officers ---")
    for o in officers:
        print(f"\nOfficer ID    : {o.get_officer_id()}")
        print(f"First Name    : {o.get_first_name()}")
        print(f"Last Name     : {o.get_last_name()}")
        print(f"Badge Number  : {o.get_badge_number()}")
        print(f"Rank          : {o.get_rank()}")
        print(f"Contact Info  : {o.get_contact_info()}")
        print(f"Agency ID     : {o.get_agency_id()}")

def view_all_incidents():
    incidents = service.get_all_incidents()
    print("\n--- All Incidents ---")
    for i in incidents:
        print(f"\nIncident ID   : {i.get_incident_id()}")
        print(f"Type          : {i.get_incident_type()}")
        print(f"Date          : {i.get_incident_date()}")
        print(f"Latitude      : {i.get_location_latitude()}")
        print(f"Longitude     : {i.get_location_longitude()}")
        print(f"Description   : {i.get_description()}")
        print(f"Status        : {i.get_status()}")
        print(f"Victim ID     : {i.get_victim_id()}")
        print(f"Suspect ID    : {i.get_suspect_id()}")
        print(f"Officer ID    : {i.get_officer_id()}")

def view_all_reports():
    reports = service.get_all_reports()
    print("\n--- All Reports ---")
    for r in reports:
        print(f"\nReport ID     : {r.get_report_id()}")
        print(f"Incident ID   : {r.get_incident_id()}")
        print(f"Report Date   : {r.get_report_date()}")
        print(f"Details       : {r.get_report_details()}")

def view_all_cases():
    print("--- All Cases ---")
    cases = service.get_all_cases()
    for case in cases:
        print(case)

def main():
    while True:
        print("""
        -------- Crime Analysis & Reporting System --------
                1. Add Victim
                2. Add Suspect
                3. Add Officer
                4. Create Incident
                5. Update Incident Status
                6. Search Incidents by Date Range
                7. Search Incidents by Type
                8. Get Incident by ID
                9. Get Officer by ID
                10. Create Case
                11. Get Case by ID
                12. Update Case Status
                13. View All Victims
                14. View All Suspects
                15. View All Officers
                16. View All Incidents
                17. View All Cases
                18. View All Reports
                0. Exit
            """)
        choice = input("Enter your choice (0-18): ")
        if choice == '1': add_victim()
        elif choice == '2': add_suspect()
        elif choice == '3': add_officer()
        elif choice == '4': create_incident()
        elif choice == '5': update_incident_status()
        elif choice == '6': get_incidents_by_date()
        elif choice == '7': get_incidents_by_types()
        elif choice == '8': get_incident_by_id()
        elif choice == '9': get_officer_by_id()
        elif choice == '10': create_case()
        elif choice == '11': get_case_by_id()
        elif choice == '12': update_case_status()
        elif choice == '13': view_all_victims()
        elif choice == '14': view_all_suspects()
        elif choice == '15': view_all_officers()
        elif choice == '16': view_all_incidents()
        elif choice == '17': view_all_cases()
        elif choice == '18': view_all_reports()
        elif choice == '0':
            print("Exiting... Thank you!!")
            break
        else:
            print("Invalid choice! Please enter a number between 0 and 18.")


if __name__ == "__main__":
    main()
