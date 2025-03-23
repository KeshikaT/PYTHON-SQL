/*Scenario:
A company maintains an Employees database, storing employee details in the following table:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    HireDate DATE,
    Salary DECIMAL(10,2),
    Department NVARCHAR(50)
);
The company needs customized reports to analyze employee details.
Tasks:
Full Name Display:
Write a query that combines FirstName and LastName into a single column named FullName (Format: "LastName, FirstName").
Age Calculation:
Add a column named Age that calculates the employee's age using the DateOfBirth field.
Years of Service:
Add a column named YearsOfService that calculates how many years an employee has worked in the company based on HireDate.
Salary Classification:
Create a new column named SalaryCategory that classifies employees into:
'Low' if Salary < 50,000
'Medium' if Salary between 50,000 and 100,000
'High' if Salary > 100,000
Use a SQL function (CASE or IIF) to achieve this.
Joining Month Name:
Display the full name of the month in which the employee was hired using a SQL function.*/

--creating database
create database Employees
use EmployeeRecords

--create table
create table Employees (
EmployeeID int primary key,
FirstName varchar(50),
LastName varchar(50),
DateOfBirth date,
HireDate date,
Salary decimal(10,2),
Department varchar(50)
);

insert into Employees values  
(1, 'Jon', 'Everett', '1991-03-29', '2007-12-12', 50000, 'IT'),  
(2, 'Noah', 'Burch', '1990-07-15', '2010-06-01', 75000, 'HR'),  
(3, 'Gerald', 'Wells', '1985-09-22', '2005-04-20', 120000, 'Finance'),  
(4, 'Jovanni', 'Moran', '1993-05-10', '2018-07-30', 45000, 'Marketing'),  
(5, 'Celeste', 'Salgado', '1988-11-18', '2012-09-15', 98000, 'Sales'),  
(6, 'Trace', 'Carey', '1995-01-08', '2020-01-10', 38000, 'Support'),  
(7, 'Alora', 'Henry', '1987-06-25', '2008-03-05', 67000, 'Development'),  
(8, 'Carlos', 'Wood', '1989-12-02', '2011-11-22', 89000, 'Operations'),  
(9, 'Marlee', 'Park', '1994-04-16', '2019-08-09', 55000, 'HR'),  
(10, 'Emmie', 'Ward', '1992-02-28', '2015-05-18', 73000, 'Finance'),  
(11, 'Jameson', 'Weeks', '1991-09-12', '2013-10-25', 64000, 'Sales');  


-- FirstName and LastName into a single column named FullName
select EmployeeID, FirstName + ', ' + LastName as FullName from Employees;

-- Age that calculates the employee's age using the DateOfBirth field
select EmployeeID, FirstName, LastName, datediff(year, DateOfBirth, getdate()) as Age from Employees;

-- YearsOfService that calculates how many years an employee has worked in the company based on HireDate.
select EmployeeID, FirstName, LastName, datediff(year, HireDate, getdate()) as YearsOfService from Employees;

-- SalaryCategory
select EmployeeID, FirstName, LastName, Salary, case 
when Salary < 50000 then 'Low'
when Salary between 50000 and 100000 then 'Medium'
else 'High'
end as SalaryCategory from Employees;

-- Full name of the month in which the employee was hired
select EmployeeID, FirstName, LastName, HireDate, 
datename(month, HireDate) as JoiningMonth from Employees;