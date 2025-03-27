use TechShop

--1 To retrieve the names and emails of all customers.  
select FirstName, LastName, Email from Customers;

--2 To list all orders with their order dates and corresponding customer names.
select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
from Orders join Customers on Orders.CustomerID = Customers.CustomerID;

--3 To insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 
insert into Customers values 
(12, 'John', 'Alice', 'alice.johnson@example.com', '(123) 456-7890', '123 Main St Navi Mumbai');

--4 to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%. 
update Products set Price = Price * 1.10
where ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Headphones', 'Smartwatch', 'Gaming Console', 'Monitor', 'Mouse', 'Keyboard', 'Camera', 'Printer');

--5 To delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. 
--Allow users to input the order ID as a parameter. 
delete from OrderDetails where OrderID = 5;
delete from Orders where OrderID = 5;

--6 To insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information. 
insert into Orders values
(12, 3, '2025-03-12', 65000);

--7  To update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.
update Customers set Email = 'gerald.new@example.com', Address ='321,Apple St'
where CustomerID = 3;

--8 To recalculate and update the total cost of each order in the "Orders"table based on the prices and
--quantities in the "OrderDetails" table. 
update Orders
set TotalAmount = (select sum(Products.Price * OrderDetails.Quantity)
from OrderDetails
join Products on OrderDetails.ProductID = Products.ProductID
where OrderDetails.OrderID = Orders.OrderID
);

--9  to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables.
--Allow users to input the customer ID as a parameter.
delete from OrderDetails 
where OrderID in (select OrderID from Orders where CustomerID = 8)
delete from Orders where CustomerID = 8;

--10  to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 
insert into Products values 
(12, 'Smart Speaker', 'Amazon Echo with Alexa', 15000);

--11  to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped").
--Allow users to input the order ID and the new status. 
alter table Orders add Status varchar(20); 
update Orders set Status = 'shipped'
where OrderID = 5;

--12 to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table. 
alter table Customers add OrderCount int default 0; 
update Customers
set OrderCount = (select count(*) from Orders where Orders.CustomerID = Customers.CustomerID
);