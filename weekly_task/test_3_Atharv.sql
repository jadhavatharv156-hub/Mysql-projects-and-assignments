create database Test_60P ;
use Test_60P ;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE,
    performance_rating INT,
    city VARCHAR(50)
);

INSERT INTO employees (id, name, age, department, salary, join_date, performance_rating, city) VALUES
(1, 'Alice', 28, 'HR', 50000.00, '2021-01-15', 3, 'New York'),
(2, 'Bob', 35, 'Finance', 70000.00, '2019-03-10', 4, 'Chicago'),
(3, 'Charlie', 30, 'IT', 80000.00, '2018-07-01', 5, 'Los Angeles'),
(4, 'David', 40, 'Finance', 75000.00, '2017-11-23', 2, 'New York'),
(5, 'Eve', 25, 'IT', 60000.00, '2022-05-20', 4, 'San Francisco'),
(6, 'Frank', 50, 'HR', 55000.00, '2015-09-15', 1, 'Chicago'),
(7, 'Grace', 45, 'Marketing', 72000.00, '2020-02-12', 5, 'Seattle'),
(8, 'Hank', 32, 'IT', 82000.00, '2016-06-18', 4, 'New York'),
(9, 'Ivy', 29, 'Marketing', 71000.00, '2021-12-01', 3, 'Los Angeles'),
(10, 'Jack', 38, 'Finance', 68000.00, '2019-04-25', 4, 'Boston'),
(11, 'Karen', 33, 'HR', 54000.00, '2018-08-11', 3, 'Chicago'),
(12, 'Leo', 26, 'IT', 65000.00, '2023-03-05', 2, 'San Francisco'),
(13, 'Mona', 27, 'Marketing', 73000.00, '2020-11-17', 5, 'New York'),
(14, 'Nina', 36, 'Finance', 76000.00, '2019-06-30', 3, 'Chicago'),
(15, 'Oscar', 31, 'IT', 81000.00, '2017-02-14', 4, 'Los Angeles');

select * from employees ;

-- 1) Find all employees whose name starts with 'A'.
select * 
from employees
where name like "A%";

-- 2) Names ending with 'e'.
select * 
from employees
where name like "%e";

-- 3) Employees younger than 30.
select * 
from employees
where age < 30;

-- 4) Employees with salary over 75,000.
select *
from employees
where salary  > 75000;

-- 5) Employees aged between 30 and 40.
select * 
from employees 
where age between 30 and 40 ;

-- 6) Join date between 2018 and 2020.
select * 
from employees
where join_date between "2017-12-31" and "2020-12-31" ;

-- 7) Label performance as 'Poor', 'Average', 'Good', 'Excellent'.
select * ,
case 
when performance_rating = 5 then "excellent"
when performance_rating = 4 then "good"
when performance_rating = 3 then "average"
else "poor"
end as label
from employees;

-- 8) Count employees per department.
select department ,
count(*) as emp_dept
from employees
group by department;

-- 9) Average salary per city.
select city ,
avg(salary) as avg_sal_city
from employees 
group by city;

-- 10) Cities with average salary > 70000.
select city ,
avg(salary) as avg_sal
from employees
group by city
having avg_sal > 70000;

-- 11) Total salary per department.
select department ,
sum(salary) as total_sal
from employees
group by department;

-- 12) Employees with salary above average.
select * 
from employees 
where salary >(
select avg(salary) as avg_sal
from employees);

-- 13) Employees in the same city as 'Alice'
select * from employees where city =
(
select city from employees where name = "alice"
);

-- 14) Departments with more than 3 employees.
select department ,
count(id) as emp_count 
from employees
group by department
having emp_count > 3;

-- 15) Employees in top 3 highest paying departments.
select department ,
max(salary) as high_sal
from employees
group by department
order by high_sal desc
limit 3;

-- 16) Employees in cities containing the word 'San'.
select * 
from employees
where city like "%san%";

-- 17) Employees who joined between 2019 and 2022.
select * 
from employees
where join_date between "2018-12-31" and "2022-12-31";

-- 18) Departments spending over 200,000 in salaries.
select department,
sum(salary) as total_sal
from employees
group by department
having total_sal > 200000;

-- 19) create one constraints table at least use foure
create table customer (
custom_ID int auto_increment primary key,
custom_name varchar(30) not null,
phone_no varchar(20) unique,
age int check (age >= 18),
city varchar(25) default ("satara")
);
select * from customer;
