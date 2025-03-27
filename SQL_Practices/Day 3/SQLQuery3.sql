use foundationtraining1;

-- drop tables if they exist to avoid errors
drop table if exists Employees, Depart, Salaries, Customers, Orders, Students, Dept;

-- create employees table
create table Employees (
employeeID int primary key,
employeeName varchar(50),
DepartID int
);

-- insert data into employees
insert into Employees values 
(1, 'shubham', 101), 
(2, 'saksham', 104), 
(3, 'bham', 103), 
(4, 'bhavu', 101), 
(5, 'meesha', 102), 
(6, 'krishna', 103);

-- create department table
create table Depart (
DepartID int primary key,
DepartName varchar(50)
);

-- insert data into depart
insert into Depart values 
(101, 'it'), 
(102, 'hr'), 
(103, 'finance'), 
(104, 'inventory');

-- inner join employees and depart tables
select e.employeeID, e.employeeName, e.DepartID, d.DepartName 
from Employees e 
inner join Depart d on e.DepartID = d.DepartID;

-- left join
select e.employeeName, e.DepartID, d.DepartName 
from Employees e 
left join Depart d on e.DepartID = d.DepartID 
order by e.employeeName;

-- right join
select e.employeeName, d.DepartName 
from Employees e 
right join Depart d on e.DepartID = d.DepartID 
order by e.employeeName;

-- full join
select e.employeeName, e.DepartID, d.DepartName 
from Employees e 
full join Depart d on e.DepartID = d.DepartID 
order by e.employeeName;

-- cross join
select e.*, d.* 
from Employees e 
cross join Depart d;

-- inner join with group by
select d.DepartName, count(e.employeeID) as EmployeeCount
from Employees e
inner join Depart d on e.DepartID = d.DepartID
group by d.DepartName;

-- inner join with group by and having
select d.DepartName, count(e.employeeID) as EmployeeCount
from Employees e
inner join Depart d on e.DepartID = d.DepartID
group by d.DepartName
having count(e.employeeID) > 2;

drop table Employees
-- create employees table with department as string
create table Employees2 (
EmployeeID int primary key,
EmployeeName varchar(100),
Department varchar(50)
);

-- create salaries table
create table Salaries (
SalaryID int primary key,
EmployeeID int,
SalaryDate date,
SalaryAmount decimal(10,2),
foreign key (EmployeeID) references Employees2(EmployeeID)
);

-- insert data into employees
insert into Employees2 values
(1, 'Alice Johnson', 'HR'),
(2, 'Bob Smith', 'IT'),
(3, 'Charlie Brown', 'Finance'),
(4, 'David Lee', 'Marketing');

-- insert data into salaries
insert into Salaries values
(201, 1, '2024-01-10', 5000.00),
(202, 1, '2024-02-15', 5500.00),
(203, 2, '2024-01-20', 6000.00),
(204, 3, '2024-03-05', 7000.00),
(205, 4, '2024-03-10', 4800.00),
(206, 1, '2024-03-15', 5200.00),
(207, 2, '2024-04-01', 6200.00),
(208, 3, '2024-04-05', 7500.00);

-- total salary paid to each employee
select e.EmployeeID, e.EmployeeName, sum(s.SalaryAmount) as TotalSalary
from Employees2 e
join Salaries s on e.EmployeeID = s.EmployeeID
group by e.EmployeeID, e.EmployeeName;

-- employees with total salary greater than 15000
select e.EmployeeID, e.EmployeeName, sum(s.SalaryAmount) as TotalSalary
from Employees2 e
join Salaries s on e.EmployeeID = s.EmployeeID
group by e.EmployeeID, e.EmployeeName
having sum(s.SalaryAmount) > 15000;

-- using grouping sets
select e.EmployeeID, e.EmployeeName, s.SalaryDate, sum(s.SalaryAmount) as TotalSalary
from Employees2 e
join Salaries s on e.EmployeeID = s.EmployeeID
group by grouping sets (
(e.EmployeeID, e.EmployeeName), 
(s.SalaryDate),()                                
);

-- customers table
create table Customers (
CustomerID int primary key,
CustomerName varchar(100),
City varchar(50)
);

-- orders table
create table Orders (
OrderID int primary key,
CustomerID int,
OrderDate date,
TotalAmount decimal(10,2),
foreign key (CustomerID) references Customers(CustomerID)
);

-- insert data into customers
insert into Customers values
(1, 'Alice Johnson', 'New York'),
(2, 'Bob Smith', 'Los Angeles'),
(3, 'Charlie Brown', 'Chicago'),
(4, 'David Lee', 'Houston');

-- insert data into orders
insert into Orders values
(101, 1, '2024-01-10', 500.00),
(102, 1, '2024-02-15', 1500.00),
(103, 2, '2024-01-20', 2000.00),
(104, 3, '2024-03-05', 3000.00),
(105, 4, '2024-03-10', 1200.00),
(106, 1, '2024-03-15', 700.00),
(107, 2, '2024-04-01', 1800.00),
(108, 3, '2024-04-05', 2500.00);

-- total amount spent by each customer
select c.CustomerID, c.CustomerName, sum(o.TotalAmount) as TotalSpent
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CustomerName;

-- customers who spent more than 5000
select c.CustomerID, c.CustomerName, sum(o.TotalAmount) as TotalSpent
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CustomerName
having sum(o.TotalAmount) > 5000;

-- students table
create table Students (
StudID int primary key,
StudName varchar(50),
DeptID int,
StudRank int
);
drop table Students
-- insert data into students
insert into Students values
(1, 'Ram', 101, 2),
(2, 'Raj', 100, 1),
(3, 'Ravi', 100, 2),
(4, 'Rahul', 101, 1),
(5, 'Charu', 102, 1);

-- department table
create table Dept (
DeptID int primary key,
DeptName varchar(15),
DeptToppers int
);

-- insert data into dept
insert into Dept values
(100, 'CSE', 2),
(101, 'ECE', 2),
(102, 'EEE', 1);

sp_help Students;
sp_help Dept;

-- inner join students and dept
select s.StudID, s.StudName, d.DeptName
from Students s 
inner join Dept d on s.DeptID = d.DeptID;

-- left join students and dept
select s.StudID, s.StudName, d.DeptName
from Students s 
left join Dept d on s.DeptID = d.DeptID;

-- right join students and dept
select s.StudID, s.StudName, d.DeptName
from Students s 
right join Dept d on s.DeptID = d.DeptID;

-- full join
select s.StudID, s.StudName, d.DeptName
from Students s 
full join Dept d on s.DeptID = d.DeptID;

-- cross join 
select s.StudID, s.StudName, d.DeptName
from Students s 
cross join Dept d;

-- self join
select a.StudID as Student1_ID, a.StudName as Student1, 
b.StudID as Student2_ID, b.StudName as Student2, a.DeptID
from Students a 
join Students b on a.DeptID = b.DeptID and a.StudID <> b.StudID;


