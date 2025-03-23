--Creating a database named "TechShop" 
create database TechShop
use TechShop

--Define the schema tables based on the provided schema. 
create table Customers(CustomerID int Primary Key,
FirstName varchar(20),
LastName varchar(20), 
Email varchar(30),
Phone varchar(15),
Address varchar(50)
);
create table Products(ProductID int Primary Key,
ProductName varchar(20), 
Description varchar(50),
Price int
);
create table Orders(OrderID int Primary Key,
CustomerId int Foreign Key references Customers(CustomerID),
OrderDate date,
TotalAmount int
);
create table OrderDetails(OrderDetailID int Primary Key,
OrderId int Foreign Key references Orders(OrderID),
ProductId int Foreign Key references Products(ProductID),
Quantity int
);
create table Inventory(InventoryID int Primary Key,
ProductId int Foreign Key references Products(ProductID),
QuantityInStock int,
LastStockUpdate date
);

--Inserting sample records
insert into Customers values
(1, 'Jon', 'Everett', 'JonEverett@gmail.com', '(804)771-9747', '7, Opp. Ashok Niwas, Relief Road'),
(2, 'Noah', 'Burch', 'NoahBurch@abc.com', '(401)671-7076', 'D/4, Amrut, Runwala Park Chembur Naka, Chembur'),
(3, 'Gerald', 'Wells', 'gerald.wells@example.com', '(361)253-7061', 'B 40, Part 4 Amar Colony'),
(4, 'Jovanni', 'Moran', 'jovanni.moran@example.com', '(680)758-8844', 'Lakshadeep, Off Gulmohar Cross Road'),
(5, 'Celeste', 'Salgado', 'celeste.salgado@example.com', '(970)083-0980', '7, Shyam Bhavan, B P Road, Bhayander(e)'),
(6, 'Trace', 'Carey', 'trace.carey@example.com', '(737)058-6078', '4/121, A - Wing, Ambedkar Nagar, Worli'),
(7, 'Alora', 'Henry', 'alora.henry@example.com', '(231)260-2818', '3-3-858, Kachiguda'),
(8, 'Carlos', 'Wood', 'carlos.wood@example.com', '(947)405-6580', '140, Avtar Enclave, Rohtak Rd'),
(9, 'Marlee', 'Park', 'marlee.park@example.com', '(479)882-5643', '9 Kennedy 2nd St, Mylapore'),
(10, 'Emmie', 'Ward', 'emmie.ward@example.com', '(778)166-7865', '8, Rameshwer Bldg, Ram Maruti Road, Thane (w)'),
(11, 'Jameson', 'Weeks', 'jameson.weeks@example.com', '(573)627-8228', '116/8, Rasappa Chetty Street Park Town');

insert into Products values
(1, 'Laptop', 'Dell Inspiron 15', 50000),
(2, 'Smartphone', 'Samsung Galaxy S22', 70000),
(3, 'Tablet', 'Apple iPad Air', 60000),
(4, 'Headphones', 'Sony WH-1000XM4', 25000),
(5, 'Smartwatch', 'Apple Watch Series 7', 35000),
(6, 'Gaming Console', 'PlayStation 5', 55000),
(7, 'Monitor', 'LG UltraGear 27-inch', 40000),
(8, 'Mouse', 'Logitech MX Master 3', 12000),
(9, 'Keyboard', 'Mechanical RGB Keyboard', 15000),
(10, 'Camera', 'Canon EOS 90D', 90000),
(11, 'Printer', 'HP LaserJet Pro', 25000);

insert into Orders values
(1, 1, '2025-03-01', 100000), 
(2, 2, '2025-03-02', 70000),
(3, 3, '2025-03-03', 120000),
(4, 4, '2025-03-04', 25000),
(5, 5, '2025-03-05', 70000), 
(6, 6, '2025-03-06', 55000),
(7, 7, '2025-03-07', 40000),
(8, 8, '2025-03-08', 12000),
(9, 9, '2025-03-09', 15000),
(10, 10, '2025-03-10', 90000),
(11, 11, '2025-03-11', 25000);

insert into OrderDetails values
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 2), 
(4, 4, 4, 1),
(5, 5, 5, 2), 
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1),
(11, 11, 11, 1);

insert into Inventory values
(1, 1, 10, '2025-03-15'),
(2, 2, 15, '2025-03-15'),
(3, 3, 8, '2025-03-15'),
(4, 4, 12, '2025-03-15'),
(5, 5, 5, '2025-03-15'),
(6, 6, 7, '2025-03-15'),
(7, 7, 10, '2025-03-15'),
(8, 8, 20, '2025-03-15'),
(9, 9, 25, '2025-03-15'),
(10, 10, 5, '2025-03-15'),
(11, 11, 18, '2025-03-15');


