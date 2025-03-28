create database techshop;
use TechShop;
create table customers 
(CustomerID int primary key,
FirstName text,
LastName varchar(50) not null,
Email varchar(50) unique,
Phone bigint,
Address varchar(60));

insert into customers values
(1, 'Fathima', 'Zahira', 'Fathima.Zah@gmail.com', '1029384756', '123 Amityville St'),
(2, 'Manoj', 'Mani', 'ahmahmed@gmail.com', '9876543210', '108 Bu Danig Ave'),
(3, 'Sungu', 'Saitama', 'onesaitama@gmail.com', '9218239531', '456 Fubuki Ave'),
(4, 'Luffy', 'Krishnan', 'angelfruit@gmail.com', '9182305812', '789 Nami St'),
(5, 'Sungjinwoo', 'Singh', 'jinwoo@gmail.com', '9471823912', '321 Aura Farm'),
(6, 'Ichigo', 'Kumar', 'kurosaki.ichigo@example.com', '9184728248', '123 Bankai Ave'),
(7, 'Isagi', 'Kahn', 'clown@gmail.com', '9432109876', '1 Strika St'),
(8, 'Uzumaki', 'Nair', 'boruto.nair@gmail.com', '9321098765', '106 Sasuke Blvd'),
(9, 'Gojo', 'Reddy', 'gojo.suguru@gmail.com', '9420987654', '753 Shibuya Ave'),
(10, 'Mohammed', 'Aizen', 'Aizen.watashi@gmail.com', '9105576543', '852 Yokoso Rd');

select * from inventory;

alter table orders
modify column totalamount decimal(10,2);
desc customers;
UPDATE Products
SET Category = CASE
    WHEN ProductID = 1 THEN 'Touch Devices'
    WHEN ProductID = 11 THEN 'Touch Devices'
    WHEN ProductID = 4 THEN 'Touch Devices'
    WHEN ProductID = 2 THEN 'Printer'
    WHEN ProductID = 3 THEN 'Wearable Technology'
    WHEN ProductID = 7 THEN 'Wearable Technology'
    WHEN ProductID = 10 THEN 'Wearable Technology'
    WHEN ProductID = 6 THEN 'Wearable Technology'
    WHEN ProductID = 5 THEN 'Storage Devices'
    WHEN ProductID = 8 THEN 'Drones'
    WHEN ProductID = 9 THEN 'Projector'
END;

desc orderdetails;

create table Products 
(ProductID int primary key,
ProductName text not null,
Description varchar(255),
Price decimal(10,2) not null);

insert into products values 
(1,'Laptop', 'High-performance laptop', 5500.00),
(2,'Laser Printer', 'Lightweight and lighting fast Printer', 1100.00),
(3,'Smart Gloves', 'Highly durable and innovative Smart Gloves', 880.00),
(4,'Stretchable Smartphone', 'A flexible, unbreakable smartphone', 1925.00),
(5,'Shadow SSD', 'A high-speed 1TB SSD with rapid data transfer', 825.00),
(6,'Hollow VR Headset', 'A VR headset with immersive audio and visuals', 2530.00),
(7,'Tactical Smart Watch', 'Advanced sports analyzing watch', 1700.00),
(8,'Rasengan Drone', 'High-speed drone with rotor blades', 3200.00),
(9,'Infinity Projector', 'Projector with limitless focus and crystal-clear visuals', 1980.00),
(10,'Illusionary Smart Glasses', 'Smart glasses with holographic displays', 2200.00);
desc products;

drop table OrderDetails;

create table Orders
(OrderID int primary key,
CustomerID int not null,
OrderDate date,
TotalAmount decimal(10,2),
foreign key (CustomerID) references customers(CustomerID));

insert into orders values
(1, 1, '2024-12-30', 5500.00),
(2, 2, '2024-11-29', 2000.00),
(3, 3, '2025-03-13', 88000.00),
(4, 4, '2025-03-11', 38500.00),
(5, 5, '2025-02-05', 11550.00),
(6, 6, '2025-01-28', 154330.00),
(7, 7, '2025-03-25', 180200.00),
(8, 8, '2025-03-15', 26400.00),
(9, 9, '2025-03-19', 3960.00),
(10, 10, '2025-04-30', 22000.00);

create table OrderDetails 
(OrderDetailId int primary key,
OrderID int not null,
ProductID int not null,
Quantity long not null,
foreign key(OrderID) references Orders(OrderID) on delete cascade,
foreign key(ProductID) references Products (ProductID));

insert into OrderDetails values
(101,1, 1, 1),
(102,2, 2, 75),
(103,3, 3, 100),
(104,4, 3, 20),
(105,5, 5, 14),
(106,6, 6, 61),
(107,7, 7, 106),
(108,8, 5, 32),
(109,9, 9, 2),
(110,10, 10, 10);


create table Inventory 
(InventoryID int primary key,
ProductID int not null,
QuantityInStock int,
LastStockUpdate datetime not null,
foreign key (ProductID) references Products(ProductID));

insert into Inventory values
(201,1, 100, '2025-03-16 15:10:39'),
(202,2, 150, '2025-03-16 15:28:18'),
(203,3, 200, '2025-03-16 15:28:18'),
(204,4, 25, '2025-03-16 15:28:18'),
(205,5, 100, '2025-03-16 15:28:18'),
(206,6, 100, '2025-03-16 15:28:18'),
(207,7, 160, '2025-03-16 15:28:18'),
(208,8, 50, '2025-03-16 15:28:18'),
(209,9, 75, '2025-03-16 15:28:18'),
(210, 10, 100, '2025-03-16 15:28:18');

desc Inventory;
/* task 2 
Q1) Retrieve the names and emails of all customers */

Select FirstName, LastName, Email
from Customers;

/* 
Q2) List all orders with their order dates and corresponding customer names */

select o.OrderID, o.OrderDate, c.FirstName, c.LastName
From Orders o
join Customers c on o.CustomerID = c.CustomerID;

/*Q3) Insert a new customer record into the "Customers" table */

Insert into customers values 
(11, 'Musfi', 'Begum', 'musfirah@gmail.com', 9182471829, '123 One Tower St');

SET SQL_SAFE_UPDATES = 1;
/* Q4) Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%*/
update Products
set Price = Price * 1.10;


/* Q5) Delete a specific order and its associated order details */
delete from OrderDetails
where orderid = 2;
delete from orders 
where orderid =2;


select * from orders;
;
/* Q6) Insert a new order into the "Orders" table */
insert into Orders values 
(2, 2, '2025-04-15', 4500.00, 'Shipped');

/* Q7) Update the contact information of a specific customer*/

update customers
set email = 'sherry@gmail.com', address= ' 108 Jeju isle Ave'
where customerid=2;

/* Q8) Recalculate and update the total cost of each order */
update Orders o
join (select od.OrderID, sum(p.Price * od.Quantity) as TotalAmount
from OrderDetails od
join Products p on od.ProductID = p.ProductID
group by od.OrderID
) as OrderTotals on o.OrderID = OrderTotals.OrderID
set o.TotalAmount = OrderTotals.TotalAmount;
select * from orderdetails;

/* Q9) Delete all orders and associated order details for a specific customer*/

delete from orders
where customerID = 2;

/* Q10) Insert a new electronic gadget product*/
select * from orders;

insert into products values
(11,'Tablet', 'Advanced M4 chip integrated Tablet', 3190.00);

/* Q11) update the status of a specific order */
alter table orders 
add status varchar(20);

update orders 
set status = 'Pending';

update Orders
set status = 'Shipped'
where orderid=1;

/* Q12) Calculate and update the number of orders placed by each customer */

alter table customers 
add NoOfOrders long;

update Customers c
set NoOfOrders =(
select COUNT(*)
from Orders o
where o.CustomerID = c.CustomerID
);

select * from customers;

/*TASK 3
Q1)Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.*/

select orderid, totalamount, customers.* 
from orders 
join customers  on orders.customerid = customers.customerid;

/*Q2) Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue. */

select productname, sum(price * quantity) as TotalRevenue
from orderdetails
join products on orderdetails.productid = products.productid
group by productname;

/* Q3) Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.*/
select distinct c.customerid, concat(c.firstname,' ', c.lastname) as fullname, c.email, c.phone
from customers c
join orders o on c.customerid = o.customerid;

/*Q4)Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered. */

select p.productname, sum(q.quantity) as TotalQuantity 
from orderdetails q
join products p on q.productid = p.productid
group by p.productname
order by totalquantity desc
limit 1;

/*Q5) Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.*/
select productname, category
from products;

/*Q6) Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value. */

select c.customerid, concat( c.firstName,' ', c.lastName)as FullName, avg(o.TotalAmount) as AverageOrderValue
from customers c
join orders o on c.customerid = o.customerid
group by c.customerID, c.firstname, c.lastname;

/*Q7) Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.*/

select o.orderid,c.firstname, c.lastname, o.totalamount as totalrevenue
from orders o
join customers c on o.customerid = c.customerid
order by totalrevenue desc
limit 1;

/*Q8) Write an SQL query to list electronic gadgets and the number of times each product has been ordered.*/

select productname, count(orderdetailid) as NoOfOrders
from products
left join orderdetails on products.productid = orderdetails.productid
group by productname;

/*Q9) Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter. */

select c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where p.ProductName = 'Laptop'; 

/*Q10) Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters. */

select sum(totalamount) as totalrevenue
from orders 
where orderdate between '2025-01-01' and '2025-04-02';

/* TASK 4
 Q1) Write an SQL query to find out which customers have not placed any orders.*/

select customerid, firstname, lastname
from customers
where customerid not in (
select distinct customerid
from orders);

/* Q2) Write an SQL query to find the total number of products available for sale.*/

select count(*) as totalproducts
from products
where productid in (
select productid
from inventory
where quantityinstock > 0);

/* Q3) Write an SQL query to calculate the total revenue generated by TechShop.*/

select sum(TotalAmount) as TotalRevenue
from (
select TotalAmount
from Orders) 
as OrderTotals;

/* Q4) Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter. */

select avg(quantity) as averagequantityordered
from orderdetails
where productid in (
select productid
from products
where category = 'wearable technology');

/* Q5) Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter. */

select customerid, fullname, sum(totalamount) as totalrevenue
from (
select c.customerid, concat(c.firstname, ' ', c.lastname) as fullname, o.totalamount
from customers c
join orders o on c.customerid = o.customerid
where c.customerid = 1 
) as customertotals
group by customerid, fullname;

/* Q6) Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.*/

select customerid, fullname, numorders
from (
select c.customerid, concat(c.firstname, ' ', c.lastname) as fullname, count(o.orderid) as numorders
from customers c
join orders o on c.customerid = o.customerid
group by c.customerid, fullname) as customerorders
order by numorders desc;

/* Q7) Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.*/

select category, TotalQuantityOrdered
from ( select p.category, sum(o.quantity) as totalquantityordered
from orderdetails o
join products p on o.productid=p.productid
group by p.category
) as CategoryTotal
order by TotalQuantityOrdered desc
limit 1;

/* Q8) Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending. */

select customerid, fullname, TotalSpending
from (
select c.customerid, concat(c.FirstName, ' ', c.LastName) as FullName,
sum(o.totalamount) as totalspending
from customers c
join orders o on c.customerid = o.customerid
group by c.customerid, FullName) as customerspending
order by TotalSpending desc
limit 1;

/* Q9) Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.*/

select c.customerid, concat(c.firstname, ' ', c.lastname) as fullname,
(select sum(o.totalamount) from orders o where o.customerid = c.customerid) / 
(select count(o.orderid) from orders o where o.customerid = c.customerid) as averageordervalue
from customers c
where exists (
select 1
from orders o
where o.customerid = c.customerid);

/* Q10) Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.*/

select fullname, ordercount 
from (
select 
concat(c.firstname,' ', c.lastname) as fullname,
count(o.orderid) as ordercount 
from customers c 
left join orders o on c.customerid = o.customerid 
group by c.customerid, c.firstname, c.lastname)
as customer_orders;