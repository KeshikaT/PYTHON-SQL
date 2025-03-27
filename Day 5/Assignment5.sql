--Assignment 5
use SalesDB
--Section A: Storing and Manipulating Data (15 Marks)
/*1. Storing Data in a Table (3 Marks)
a) Write an SQL query to create a table named Employees with the fields:
•	EmployeeID (Primary Key, INT, Auto-increment)
•	Name (VARCHAR(100), NOT NULL)
•	Age (INT)
•	Department (VARCHAR(50))
•	Salary (DECIMAL(10,2))*/
create table Employees(
EmployeeID int primary key,
Name varchar(100) not null,
Age int,
Department varchar(50),
Salary decimal(10,2)
);

drop table Employees
--b) Insert three records into the Employees table.
insert into Employees values
(1, 'Jon Everett',28, 'IT',50000),  
(2, 'Noah Burch', 32,  'HR',75000),  
(3, 'Gerald Wells', 35, 'Finance',120000);

/*2. Updating Data in a Table (3 Marks)
Write an SQL query to update the Salary of employees in the HR department by 10%.*/
update Employees set Salary =salary*1.10

/*3. Deleting Data from a Table (3 Marks)
Write an SQL query to delete all employees from the IT department.*/
delete from Employees where Department = 'IT'

/*4. Demo: Manipulating Data in Tables (6 Marks)
a) Insert a new employee into the Employees table, but ensure the Salary is at least 30000. (2 Marks)
b) Update the Department of employees who earn more than 50000 to Senior Staff. (2 Marks)
c) Delete employees older than 60 years from the table. (2 Marks)*/
insert into Employees values
(4, 'John Durairaj', 35, 'Finance',25000);
update Employees set Department ='Senior Staff' where Salary>50000
delete from Employees where Age>60

--Section B: Retrieving and Filtering Data (35 Marks)
/*5. Retrieving Specific Attributes (3 Marks)
Write an SQL query to retrieve only the Name and Salary of all employees.*/
select Name,Salary from Employees

/*6. Retrieving Selected Rows (3 Marks)
Write an SQL query to retrieve employees from the HR department who have a salary greater than 50,000.*/
select * from Employees where Department='HR' and Salary>50000

/*7. Demo: Retrieving Data (4 Marks)
Write an SQL query to retrieve all employees sorted by Salary in descending order.*/
select * from Employees order by Salary desc

/*8. Filtering Data - WHERE Clauses (5 Marks)
a) Write an SQL query to retrieve employees whose Age is greater than 30. (2 Marks)
b) Retrieve employees whose Department is either HR or Finance. (3 Marks)*/
select * from Employees where Age>30
select * from Employees where Department='HR' or Department='Finance'

/*9. Filtering Data - Operators (10 Marks)
a) Retrieve employees whose Salary is between 30,000 and 60,000. (2 Marks)
b) Retrieve employees whose Name starts with "A". (2 Marks)
c) Retrieve employees who do NOT belong to the IT department. (2 Marks)
d) Retrieve employees whose Department is either "Sales" or "Marketing" using the IN operator. (2 Marks)
e) Retrieve employees with distinct Department names. (2 Marks)*/
select * from Employees where Salary between 30000 and 60000
select * from Employees where Name like 'a%' 
select * from Employees where Department!='IT'
select * from Employees where Department in('Sales','Marketing')
select distinct Department from Employees

/*10. Column & Table Aliases (3 Marks)
Write an SQL query that retrieves EmployeeID, Name, and Salary, renaming EmployeeID as "ID" 
and Salary as "Monthly Income".*/
select EmployeeID as ID, Name, Salary as MonthlyIncome
from Employees

/*11. Demo: Filtering Data (4 Marks)
Write an SQL query to retrieve employees whose Name contains "John" and whose salary is greater than 40,000.*/
select Name from Employees 
where Name like 'John%' and Salary>40000

