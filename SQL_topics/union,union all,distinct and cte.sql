create database new_sales;
use new_sales;

CREATE TABLE Jan_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Jan_Sales VALUES
(1,'Rahul',1000),
(2,'Amit',1200),
(3,'Priya',1500),
(4,'Neha',1800),
(5,'Vikas',2000),
(6,'Pooja',2200),
(7,'Rohit',2500),
(8,'Karan',2700),
(9,'Anjali',3000),
(10,'Sneha',3200),
(11,'Arjun',3500),
(12,'Meera',3800),
(13,'Nitin',4000),
(14,'Riya',4200),
(15,'Sagar',4500),
(16,'Tina',4800),
(17,'Ajay',5000),
(18,'Kavya',5200),
(19,'Mohit',5500),
(20,'Simran',5800);

CREATE TABLE Feb_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Feb_Sales VALUES
(11,'Arjun',3500),
(12,'Meera',3800),
(13,'Nitin',4000),
(14,'Riya',4200),
(15,'Sagar',4500),
(16,'Tina',4800),
(17,'Ajay',5000),
(18,'Kavya',5200),
(19,'Mohit',5500),
(20,'Simran',5800),
(21,'Aakash',6000),
(22,'Nisha',6200),
(23,'Deepak',6500),
(24,'Payal',6800),
(25,'Manish',7000),
(26,'Komal',7200),
(27,'Yash',7500),
(28,'Isha',7800),
(29,'Vivek',8000),
(30,'Preeti',8200);

CREATE TABLE Mar_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Mar_Sales VALUES
(21,'Aakash',6000),
(22,'Nisha',6200),
(23,'Deepak',6500),
(24,'Payal',6800),
(25,'Manish',7000),
(26,'Komal',7200),
(27,'Yash',7500),
(28,'Isha',7800),
(29,'Vivek',8000),
(30,'Preeti',8200),
(31,'Harsh',8500),
(32,'Pallavi',8800),
(33,'Rakesh',9000),
(34,'Tanvi',9200),
(35,'Varun',9500),
(36,'Shweta',9800),
(37,'Gaurav',10000),
(38,'Divya',10200),
(39,'Abhishek',10500),
(40,'Sonal',10800);

CREATE TABLE Apr_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Apr_Sales VALUES
(31,'Harsh',8500),
(32,'Pallavi',8800),
(33,'Rakesh',9000),
(34,'Tanvi',9200),
(35,'Varun',9500),
(36,'Shweta',9800),
(37,'Gaurav',10000),
(38,'Divya',10200),
(39,'Abhishek',10500),
(40,'Sonal',10800),
(41,'Nikhil',11000),
(42,'Priti',11200),
(43,'Akash',11500),
(44,'Monika',11800),
(45,'Hemant',12000),
(46,'Jyoti',12200),
(47,'Ankit',12500),
(48,'Sakshi',12800),
(49,'Rohan',13000),
(50,'Aarti',13200);

CREATE TABLE May_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO May_Sales VALUES
(41,'Nikhil',11000),
(42,'Priti',11200),
(43,'Akash',11500),
(44,'Monika',11800),
(45,'Hemant',12000),
(46,'Jyoti',12200),
(47,'Ankit',12500),
(48,'Sakshi',12800),
(49,'Rohan',13000),
(50,'Aarti',13200),
(51,'Kunal',13500),
(52,'Neetu',13800),
(53,'Tarun',14000),
(54,'Poonam',14200),
(55,'Ritesh',14500),
(56,'Muskan',14800),
(57,'Lokesh',15000),
(58,'Nandini',15200),
(59,'Chirag',15500),
(60,'Rupali',15800);

CREATE TABLE Jun_Sales (
    Customer_ID INT,
    Customer_Name VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Jun_Sales VALUES
(51,'Kunal',13500),
(52,'Neetu',13800),
(53,'Tarun',14000),
(54,'Poonam',14200),
(55,'Ritesh',14500),
(56,'Muskan',14800),
(57,'Lokesh',15000),
(58,'Nandini',15200),
(59,'Chirag',15500),
(60,'Rupali',15800),
(61,'Aman',16000),
(62,'Bhavna',16200),
(63,'Chetan',16500),
(64,'Disha',16800),
(65,'Esha',17000),
(66,'Farhan',17200),
(67,'Ganesh',17500),
(68,'Hina',17800),
(69,'Imran',18000),
(70,'Jaya',18200);

select * from jan_sales
union 
select * from feb_sales;

select * from jan_sales
union all
select * from feb_sales;

select count(*)
from (
select * from jan_sales
union 
select * from feb_sales ) as tt;

select count(*)
from (
select * from jan_sales
union all
select * from feb_sales ) as er;

select * from jan_sales
union 
select * from feb_sales
union 
select * from mar_sales;

select count(*)
from(
select * from jan_sales
union 
select * from feb_sales
union 
select * from mar_sales) as ew;

create table master_table as
select * from jan_sales
union 
select * from feb_sales
union 
select * from mar_sales
union
select * from apr_sales
union
select * from may_sales;

select count(*) from master_table;

insert into master_table
select * from jun_sales ;

select * from master_table ;

-- check which customer are duplicate 

select customer_id , count(*)
from master_table
group by customer_id 
having count(*) > 1 ;

-- with cte common table expression
-- in cte we cannot delete or update in mysql it mainly work in sql server 

with CTE as (
	select * , 
    row_number() over(partition by customer_id order by Sales_amount desc) as RN
    from master_table
)
select * 
from CTE 
where RN > 1 ;

-- using distinct

create table Sales_data_new as 
select distinct * 
from master_table ;

select * from sales_data_new ; 

drop table master_table ;

rename table Sales_data_new to Master_table ;

select * from master_table ;
