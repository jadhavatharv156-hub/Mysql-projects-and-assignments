create database test;
use test;

CREATE TABLE Sales (
    Order_ID INT,
    Customer_Name VARCHAR(50),
    City VARCHAR(30),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    Order_Date DATE,
    Status VARCHAR(20)
);

INSERT INTO Sales VALUES
(101, 'Amit', 'Pune', 'Laptop', 2, 55000, '2025-01-05', 'Completed'),
(102, 'Priya', 'Mumbai', 'Mobile', 5, 15000, '2025-01-06', 'Pending'),
(103, 'Rahul', 'Delhi', 'Headphones', 8, 2000, '2025-01-07', 'Completed'),
(104, 'Sneha', 'Pune', 'Tablet', 3, 18000, '2025-01-08', 'Cancelled'),
(105, 'Rohit', 'Bangalore', 'Laptop', 1, 60000, '2025-01-09', 'Completed'),
(106, 'Anjali', 'Mumbai', 'Mobile', 12, 12000, '2025-01-10', 'Completed'),
(107, 'Vikas', 'Delhi', 'Keyboard', 15, 1500, '2025-01-11', 'Pending'),
(108, 'Neha', 'Pune', 'Mouse', 20, 800, '2025-01-12', 'Completed'),
(109, 'Karan', 'Chennai', 'Monitor', 4, 10000, '2025-01-13', 'Completed'),
(110, 'Pooja', 'Mumbai', 'Printer', 2, 7000, '2025-01-14', 'Cancelled'),
(111, 'Arjun', 'Delhi', 'Laptop', 6, 50000, '2025-01-15', 'Completed'),
(112, 'Meera', 'Pune', 'Mobile', 10, 18000, '2025-01-16', 'Pending'),
(113, 'Suresh', 'Bangalore', 'Tablet', 7, 22000, '2025-01-17', 'Completed'),
(114, 'Kavita', 'Mumbai', 'Mouse', 25, 900, '2025-01-18', 'Completed'),
(115, 'Deepak', 'Delhi', 'Keyboard', 18, 1200, '2025-01-19', 'Pending'),
(116, 'Riya', 'Chennai', 'Laptop', 2, 65000, '2025-01-20', 'Completed'),
(117, 'Manoj', 'Pune', 'Monitor', 5, 11000, '2025-01-21', 'Completed'),
(118, 'Nisha', 'Mumbai', 'Mobile', 14, 14000, '2025-01-22', 'Cancelled'),
(119, 'Ajay', 'Delhi', 'Printer', 3, 8500, '2025-01-23', 'Completed'),
(120, 'Sunita', 'Bangalore', 'Headphones', 9, 2500, '2025-01-24', 'Pending');

select * from sales;

-- Question 1:
-- Display all orders from Pune.

select * 
from sales 
where City="Pune";

-- Question 2:
-- Display all orders that are not Completed.

select * 
from sales 
where Status!="completed"; 

-- Question 3:
-- Find all orders where Quantity is greater than or equal to 10.

select * 
from sales 
where Quantity>=10;

-- Question 4:
-- Display all products with Price less than or equal to 10,000.

select * 
from sales 
where Price<=10000;

-- Question 5:
-- Find all Completed orders from Mumbai.

select * 
from sales 
where Status like "Completed" and City like "Mumbai";

-- Question 6:
-- Display all orders from Pune or Delhi.

select * 
from sales 
where City="Pune" or City="delhi";

-- Question 7:
-- Find orders where Price is between 10,000 and 30,000.

Select * 
from sales 
where Price between 10000 and 30000;

-- Question 8:
-- Find customers whose name starts with 'A'.

Select * 
from sales 
where Customer_Name like "A%";

-- Question 9:
-- Find products ending with 'r'.

select * 
from sales 
where Product like "%r";

-- Question 10:
-- Display orders where Quantity is at least 5 and Price is at least 15,000.

select * 
from sales 
where Quantity>=5 and Price>=15000;

-- Question 11:
-- Find orders from Pune or whose Price is between 20,000 and 60,000.

select * 
from sales 
where City like "Pune" or Price between 20000 and 60000;

-- Question 12:
-- Find all Completed orders from Pune or Mumbai.

select * 
from sales 
where Status like "Completed" and City="Pune" or Status like "Completed" and City="Mumbai";


-- Question 13:
-- Create a column named Order_Type:
-- Quantity >= 10 → Bulk Order
-- Otherwise → Normal Order

select *,
case
when Quantity>=10 then "Bulk Order"
else "Normal Order"
end as Order_Type
from sales;

-- Question 14:
-- Create a Price_Category column:
-- Price > 50,000 → Premium
-- Price BETWEEN 10,000 AND 50,000 → Standard
-- Otherwise → Budget

select *,
case
when Price>50000 then "Premium"
when Price between 10000 and 50000 then "standard"
else "Budget"
end as price_category
from sales;

-- Question 15:
-- Find all orders where:
-- Status is not Cancelled
-- Quantity >= 5
-- Price BETWEEN 1,000 AND 50,000
-- City is Pune, Mumbai, or Delhi

select * from sales 
where Status!="Cancelled" and Quantity>=5 and Price between 1000 and 50000 and 
Status!="Cancelled" and city like "Pune"
or Status!="Cancelled" and city like "Mumbai"  
or Status!="Cancelled"and City like "Delhi";

-- Question 16:
-- Find customers whose name starts with 'A' and ends with 't'.

select *
from sales 
where customer_Name like "A%t";

-- Question 17:
-- Create a Sales_Level column:
-- Price >= 50,000 AND Quantity >= 5 → High Sales
-- Price >= 10,000 → Medium Sales
-- Otherwise → Low Sales
select *,
case 
when Price>=50000 and Quantity>=5 then "high sales"
when Price>=10000 then "medium sales"
else "low sales"
end as sales_levels
from sales;

-- Question 18:
-- Find all Laptop and Mobile orders.
select * 
from sales 
where Product="Mobile" or Product="Laptop";

-- Question 19:
-- Find orders that are not Pending and have Quantity greater than 10.

select * 
from sales 
where Status!="Pending" and Quantity>10;

-- Question 20:
-- Find orders where Price is NOT between 10,000 and 30,000.

select * 
from sales 
where price not between 10000 and 30000;

-- Question 21:
-- Find all Completed orders where Quantity is greater than or equal to 10.

select * 
from sales 
where status="Completed" and Quantity>=10;

-- Question 22:
-- Find all orders from Pune where Price is less than or equal to 20,000.

select * 
from sales 
where City like "Pune" and Price<=20000;

-- Question 23:
-- Display orders where Product contains the word 'top'.

select * 
from sales 
where Product like "%top%";

-- Question 24:
-- Find all orders where City is Mumbai or Bangalore and Status is Completed.

select * 
from sales 
where city="Mumbai" and Status="Completed" or City="Bangalore" and Status="Completed"; 

-- Question 25:
-- Create a Discount_Eligible column:
-- Price >= 30,000 OR Quantity >= 15 → Yes
-- Otherwise → No

select *,
case
when Price>30000 or Quantity>=15 then "Yes"
else "No"
end as Discount_Eligible
from sales;

-- Question 26:
-- Find all customers whose names contain the letter 'a'.

select * 
from sales 
where Customer_Name like "%a%";

-- Question 27:
-- Find orders where Quantity is between 5 and 15 and Status is not Cancelled.

select * 
from sales 
where quantity between 5 and 15 and Status!="Cancelled";
 
-- Question 28:
-- Display all orders where Product is not Laptop.

select * 
from sales 
where Product!="Laptop";

-- Question 29:
-- Find orders from Delhi with Price greater than or equal to 5,000.

select * 
from sales 
where City="Delhi" and Price>=5000;

-- Question 30:
-- Create an Order_Priority column:
-- Price > 50,000 → High
-- Price BETWEEN 20,000 AND 50,000 → Medium
-- Otherwise → Low

select *,
case
when Price>50000 then "High"
when Price between 20000 and 50000 then "Medium"
else "Low"
end as Order_Priority
from sales;