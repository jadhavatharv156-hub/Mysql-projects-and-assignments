create database join_Assign2;
use join_Assign2;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Customers (customer_id, name, city, status) VALUES
(1, 'Alice', 'New York', 'Active'),
(2, 'Bob', 'Los Angeles', 'Inactive'),
(3, 'Charlie', 'Chicago', 'Active'),
(4, 'Diana', 'Houston', 'Active'),
(5, 'Ethan', 'Phoenix', 'Inactive'),
(6, 'Fiona', 'Philadelphia', 'Active'),
(7, 'George', 'San Antonio', 'Inactive'),
(8, 'Hannah', 'San Diego', 'Active'),
(9, 'Ian', 'Dallas', 'Active'),
(10, 'Jane', 'San Jose', 'Inactive'),
(11, 'Kevin', 'Austin', 'Active'),
(12, 'Laura', 'Jacksonville', 'Active'),
(13, 'Mike', 'Fort Worth', 'Inactive');


-- table 2 

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-06-01', 250.00),
(102, 1, '2024-06-05', 300.00),
(103, 3, '2024-06-03', 150.00),
(104, 5, '2024-06-07', 450.00),
(105, 7, '2024-06-10', 600.00),
(106, 8, '2024-06-15', 500.00),
(107, 9, '2024-06-17', 100.00),
(108, 10, '2024-06-18', 120.00),
(109, 1, '2024-06-20', 200.00),
(110, 12, '2024-06-22', 320.00),
(111, 12, '2024-06-23', 180.00),
(112, 4, '2024-06-24', 420.00),
(113, 2, '2024-06-24', 310.00);


-- 3


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, name, category, price) VALUES
(201, 'Laptop', 'Electronics', 1200.00),
(202, 'Phone', 'Electronics', 800.00),
(203, 'Headphones', 'Electronics', 150.00),
(204, 'Chair', 'Furniture', 200.00),
(205, 'Desk', 'Furniture', 350.00),
(206, 'Pen', 'Stationery', 2.50),
(207, 'Notebook', 'Stationery', 5.00),
(208, 'Mouse', 'Electronics', 50.00),
(209, 'Keyboard', 'Electronics', 70.00),
(210, 'Monitor', 'Electronics', 250.00),
(211, 'Tablet', 'Electronics', 600.00),
(212, 'Lamp', 'Furniture', 90.00),
(213, 'Ruler', 'Stationery', 1.20);

-- table 4

CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderDetails (detail_id, order_id, product_id, quantity) VALUES
(301, 101, 201, 1),
(302, 101, 206, 5),
(303, 102, 202, 1),
(304, 103, 203, 2),
(305, 104, 204, 1),
(306, 105, 205, 1),
(307, 106, 207, 10),
(308, 107, 208, 2),
(309, 108, 209, 1),
(310, 109, 210, 1),
(311, 110, 211, 1),
(312, 111, 212, 2),
(313, 112, 213, 5);

select * from customers;
select * from orders;
select * from products;
select * from orderdetails;

--  List all orders with product names and quantities, even if no products were ordered.
select  p.name ,od.quantity 
from products p 
left join orderdetails od on p.product_id = od.product_id;

--  Show total amount spent by each customer (only those who made purchases).
select o.total_amount , C.status
from orders o
join customers C on o.customer_id = c.customer_id;

--  Show each product's total revenue
select P.name , sum(p.price * od.quantity) as total_revenue
from products p 
join orderdetails od on p.product_id = od.product_id
group by p.name;

-- Find all customers who have not placed any orders.
select C.name , o.order_id
from customers c 
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;
