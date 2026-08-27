create database project;
use project;

create table Album (
Album_id int ,
Title varchar(250),
Artist_id int ) ;


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/album.csv"
INTO TABLE Album
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from album;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoice_line;
select * from media_type;
select * from playlist;
select * from playlist_track;
select * from track;

-- Who is the senior most employee based on job title?
select title ,first_name, last_name,
max(levels) as senior_level
from employee
group by title , first_name, last_name;

-- Which countries have the most invoices?
select billing_country,
count(invoice_id) as most_invoice
from invoice
group by billing_country
limit 1;

-- -- Q3: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.
select C.customer_id , C.first_name , C.last_name ,sum(i.total)
from customer C 
join invoice i on c.customer_id = i.customer_id
group by C.customer_id , C.first_name , C.last_name 
order by sum(i.total) desc
limit 1;

-- Q4 Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A

select C.email , C.first_name , C.last_name , G.name 
from customer c 
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
join genre g on t.genre_id = g.genre_id
where g.name like "%rock%"
order by c.email asc;




