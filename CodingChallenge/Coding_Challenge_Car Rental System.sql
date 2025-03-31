--Car Rental System
--creating database 
create database CarRentalSystem
use CarRentalSystem

--creating table
create table Vehicle(
vehicleID int primary key,
make varchar(50),
model varchar(50),
year int,
dailyRate decimal(10,2),
status_available bit,
passengerCapacity int,
engineCapacity int
);

create table Customer(
customerID int primary key,
firstName varchar(50),
lastName varchar(50),
email varchar(100),
phoneNumber varchar(20)
);

create table Lease(
leaseID int primary key,
vehicleID int foreign key references Vehicle(vehicleID),
customerID int foreign key references Customer(customerID),
startDate date,
endDate date,
type varchar(20) check(type in('Daily', 'Monthly'))
);

create table Payment(
paymentID int primary key,
leaseID int foreign key references Lease(leaseID),
paymentDate date,
amount decimal(10,2)
);

--inserting values to the table
insert into Vehicle values
(1,'Toyota', 'Camry', 2022, 50.00, 1, 4, 1450),
(2, 'Honda' ,'Civic', 2023, 45.00, 1, 7, 1500),
(3, 'Ford', 'Focus', 2022, 48.00, 0, 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 1, 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 1, 4, 1800),
(6, 'Hyundai', 'Sonata', 2023, 49.00, 0, 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 1, 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 1, 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 0, 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 1, 4, 2500);

insert into Customer values
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6,'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

insert into Lease values
(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10', 'Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');

insert into Payment values
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-09', 80.00),
(10, 10, '2023-10-25', 1500.00);

--tasks
-- Update the daily rate for a Mercedes car to 68.
update Vehicle
set dailyRate=68 
where make='Mercedes'
--to view
select * from Vehicle

--Delete a specific customer and all associated leases and payments.
delete from Customer where customerID = 3;

--to view
select * from Customer
select * from Lease
select * from Payment

--Rename the "paymentDate" column in the Payment table to "transactionDate".
exec sp_rename 'Payment.paymentDate','transactionDate','COLUMN'
--to view
select COLUMN_NAME
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Payment';

--Find a specific customer by email.
select * from Customer 
where email='david@example.com'

--Get active leases for a specific customer.
insert into Vehicle values 
(11, 'Tesla', 'Model 3', 2024, 60.00, 1, 5, 2000);
insert into Customer values 
(11, 'Alice', 'Green', 'alice@example.com', '555-123-6789');
insert into Lease values 
(11, 11, 11, '2023-10-10', '2025-10-31', 'Monthly');

select * from Lease where customerID = 11 AND endDate >= '2025-03-31';

--Find all payments made by a customer with a specific phone number.
select * from Payment p
join Lease l on p.leaseID = l.leaseID
join Customer c on l.customerID = c.customerID
where c.phoneNumber = '555-987-6543'

--Calculate the average daily rate of all available cars.
select avg(dailyRate) as AvgDailyRate from Vehicle
where status_available=1

--Find the car with the highest daily rate.
select top 1 * from Vehicle
order by dailyRate desc

--Retrieve all cars leased by a specific customer.
select * from Vehicle v
join Lease l on l.vehicleID=v.vehicleID
where l.customerID=7

--Find the details of the most recent lease.
select top 1 * from Lease
order by startDate desc

--List all payments made in the year 2023.
select * from Payment
where year(transactionDate)= 2023

--Retrieve customers who have not made any payments.
select * from Customer c
left join Lease l on c.customerID=l.customerID
left join Payment p on l.leaseID=p.leaseID
where p.paymentID is null

--Retrieve Car Details and Their Total Payments.
select * from Vehicle v
join Lease l on l.vehicleID=v.vehicleID
join Payment p on p.leaseID=l.leaseID

--Calculate Total Payments for Each Customer.
select c.firstName,c.lastName,c.email,c.phoneNumber,sum(p.amount) as TotalPayment from Customer c
join Lease l on c.customerID=l.customerID
join Payment p on p.leaseID=l.leaseID
group by c.customerID, c.firstName, c.lastName, c.email, c.phoneNumber

--List Car Details for Each Lease.
select l.leaseID, c.firstName, c.lastName, v.make, v.model, l.startDate, l.endDate, l.type
from Lease l
join Customer c on l.customerID = c.customerID
join Vehicle v on l.vehicleID = v.vehicleID;

--Retrieve Details of Active Leases with Customer and Car Information.
select l.*, c.firstName, c.lastName, v.make, v.model
from Lease l
join Customer c on l.customerID = c.customerID
join Vehicle v on l.vehicleID = v.vehicleID
where l.endDate >= '2025-03-31';

--Find the Customer Who Has Spent the Most on Leases.
select top 1 c.customerID, c.firstName, c.lastName, c.email, c.phoneNumber, sum(p.amount) as totalSpent
from Customer c
join Lease l on c.customerID = l.customerID
join Payment p on l.leaseID = p.leaseID
group by c.customerID, c.firstName, c.lastName, c.email, c.phoneNumber
order by totalSpent desc;


--List All Cars with Their Current Lease Information.
select v.*, l.leaseID, l.startDate, l.endDate, c.firstName, c.lastName
from Vehicle v
left join Lease l on v.vehicleID = l.vehicleID and l.endDate >= '2025-03-31'
left join Customer c on l.customerID = c.customerID;
