--Case Study 5: Working with Tables and Data Types
/*Scenario: A hospital wants to store patient records in a table.*/

--Questions:
create database HospitalManagement

/*1.	Create a table Patients with the following attributes:
o	PatientID (INT, Primary Key)
o	Name (VARCHAR)
o	Age (INT)
o	Diagnosis (TEXT)*/
create table Patients(
PatientID int primary key,
Name varchar(100),
Age int,
Diagnosis text,
);

--2. Modify the table to add a column PhoneNumber (VARCHAR(15)).
alter table Patients add PhoneNumber varchar(15)
alter table Patients add Gender varchar(10) check (Gender in ('Male', 'Female'));

3.	Rename the table to HospitalPatients.
exec sp_rename 'Patients','HospitalPatients'

4.	Drop the Diagnosis column from the table.
alter table HospitalPatients drop column Diagnosis;
delete from HospitalPatients where PatientID = 101;

--inserting values
insert into HospitalPatients values  
(101, 'Ram', 45,  '9876543210','Male'),  
(102, 'Charu', 34,  '8765432109', 'Female'),  
(103, 'Ravi', 50,  '7654321098', 'Male'),  
(104, 'Lily', 29, '6543210987', 'Female'),  
(105, 'David', 40, '5432109876', 'Male'); 

--viewing
select * from HospitalPatients





