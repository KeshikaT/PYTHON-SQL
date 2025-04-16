create database HospitalManagementSystem
use HospitalManagementSystem

create table Patient (
    patientId int primary key,
    firstName varchar(50),
    lastName varchar(50),
    dateOfBirth date,
    gender varchar(10),
    contactNumber varchar(15),
    address varchar(255)
);

create table Doctor (
    doctorId int primary key,
    firstName varchar(50),
    lastName varchar(50),
    specialization varchar(100),
    contactNumber varchar(15)
);

create table Appointment (
    appointmentId int primary key,
    patientId int foreign key references Patient(patientId),
    doctorId int foreign key references Doctor(doctorId),
    appointmentDate date,
    description text,
);

-- Inserting Patients
insert into Patient (patientId, firstName, lastName, dateOfBirth, gender, contactNumber, address)
values 
(101, 'Ravi', 'Kumar', '1990-06-15', 'Male', '9876543210', 'Chennai, Tamil Nadu'),
(102, 'Anjali', 'Sharma', '1985-02-25', 'Female', '9123456789', 'Pune, Maharashtra');

insert into Patient (patientId, firstName, lastName, dateOfBirth, gender, contactNumber, address)
values 
(103, 'Suresh', 'Patel', '1978-12-10', 'Male', '9811122233', 'Ahmedabad, Gujarat'),
(104, 'Priya', 'Nair', '1992-08-05', 'Female', '9988776655', 'Kochi, Kerala'),
(105, 'Amit', 'Singh', '1983-03-14', 'Male', '9876001234', 'Bhopal, Madhya Pradesh');


-- Inserting Doctors
insert into Doctor (doctorId, firstName, lastName, specialization, contactNumber)
values 
(201, 'Dr. Raj', 'Verma', 'Cardiologist', '9812345678'),
(202, 'Dr. Meena', 'Joshi', 'Dermatologist', '9871234560');

insert into Doctor (doctorId, firstName, lastName, specialization, contactNumber)
values 
(203, 'Dr. Alok', 'Mishra', 'Neurologist', '9822334455'),
(204, 'Dr. Sneha', 'Kapoor', 'Pediatrician', '9933445566'),
(205, 'Dr. Vikram', 'Rathore', 'Orthopedic', '9944556677');


-- Inserting Appointments
insert into Appointment (appointmentId, patientId, doctorId, appointmentDate, description)
values 
(301, 101, 201, '2025-04-20', 'Routine cardiac check-up'),
(302, 102, 202, '2025-04-21', 'Skin allergy consultation');

insert into Appointment (appointmentId, patientId, doctorId, appointmentDate, description)
values 
(303, 103, 203, '2025-04-22', 'Migraine evaluation'),
(304, 104, 204, '2025-04-23', 'Child wellness check-up'),
(305, 105, 205, '2025-04-24', 'Back pain treatment');


select * from Patient
select * from Doctor
select * from Appointment
