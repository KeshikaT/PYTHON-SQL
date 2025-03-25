--Assignment 2
--1) query to list all system databases in SQL Server.
select * from sys.databases where database_id <=4

--2) Identify the physical database files (MDF, LDF) of a user-defined database named 
--"SalesDB" using a SQL query.
select * from sys.master_files where database_id=DB_ID('SalesDB')

--3) a user-defined database named "InventoryDB" with a primary data file of 5MB and a log file of 2MB.
create database InventoryDB
on (name='InventoryDB_Data',Filename='D:\SQL_Practices\Day 4\InventoryDB_Data.mdf', size=5mb)
log on (name='InventoryDB_Log',Filename='D:\SQL_Practices\Day 4\InventoryDB_Log.ldf', size=2mb)

--4) Rename the database "InventoryDB" to "StockDB" using a SQL query.
exec sp_renamedb 'InventoryDB', 'StockDB'

--5) Drop the database "StockDB" using a SQL query.
use master
alter database StockDB set single_user with rollback immediate
drop database StockDB

--6) query to display all available data types in SQL Server.
select name as datatype from sys.types 

--7) Create a table "Products" with the following columns:
/*    ProductID (Integer, Primary Key)
	ProductName (Variable-length string, max 50 characters, Not Null)
	Price (Decimal with 2 decimal places)
	StockQuantity (Integer, Default value 0)*/
use InventoryDB
create table Products(
ProductID int primary key,
ProductName varchar(50) not null,
Price decimal(10,2),
StockQuantity int default 0);

--8) Modify the "Products" table to add a new column Category (VARCHAR(30)).
alter table Products add Category varchar(30)

--9) Rename the table "Products" to "Inventory".
exec sp_rename 'Products','Inventory'

--10) Drop the "Inventory" table from the database.
drop table Inventory

--11) Identify and list the system databases available in SQL Server. Provide a brief description of each.
select * from sys.databases where database_id <=4
--master
--tempdb
--model
--msdb

--12) Write a query to display all database files (MDF, LDF, NDF) for a specific database.
select * from sys.master_files where database_id=11

--13) Create a new user-defined database named SalesDB with a primary data file of 10MB and a log file of 5MB.
create database SalesDB
on (name='SalesDB_Data', Filename='D:\SQL_Practices\Day 4\SalesDB_Data.mdf',size=10mb)
log on (name='SalesDB_Log', Filename='D:\SQL_Practices\Day 4\SalesDB_Log.ldf',size=5mb)

--14) Rename the database SalesDB to RetailDB using an SQL query.
exec sp_renamedb 'SalesDB','RetailDB'

--15) Drop the RetailDB database safely, ensuring that no active connections exist before deletion.
alter database RetailDB set single_user with rollback immediate
drop database RetailDB