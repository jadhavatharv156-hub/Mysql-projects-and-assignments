create database group_by ;
use  group_by ;
CREATE TABLE emp (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    job_title VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    gender CHAR(1)
);

select * from emp ;
INSERT INTO emp VALUES
(1, 'Alice', 101, 'Manager', 90000, '2015-01-10', 'F'),
(2, 'Bob', 102, 'Developer', 75000, '2016-03-15', 'M'),
(3, 'Charlie', 101, 'Developer', 72000, '2017-07-01', 'M'),
(4, 'Diana', 103, 'HR', 60000, '2018-11-23', 'F'),
(5, 'Eve', 102, 'Manager', 95000, '2014-09-30', 'F'),
(6, 'Frank', 101, 'Developer', 71000, '2019-06-10', 'M'),
(7, 'Grace', 103, 'HR', 58000, '2020-05-20', 'F'),
(8, 'Heidi', 104, 'Analyst', 67000, '2017-12-01', 'F'),
(9, 'Ivan', 102, 'Developer', 74000, '2021-01-10', 'M'),
(10, 'Judy', 101, 'Manager', 88000, '2013-04-05', 'F'),
(11, 'Kevin', 104, 'Analyst', 66000, '2020-02-25', 'M'),
(12, 'Laura', 102, 'Developer', 73000, '2022-08-15', 'F'),
(13, 'Mallory', 103, 'HR', 61000, '2016-03-17', 'F'),
(14, 'Niaj', 101, 'Developer', 70000, '2021-10-19', 'M'),
(15, 'Oscar', 104, 'Analyst', 68000, '2015-06-01', 'M');

select * from emp ;

-- Basic 

select count(*) as emp_count
from emp ;

-- Find the total number of employees in each department.
select dept_id, 
count(*) as eployee_count 
from emp 
group by dept_id;

-- Find the average salary of each department.
select dept_id,
avg(salary) as average_sal_employee 
from emp
group by dept_id;


-- Find the number of employees by job title.
select job_title, 
count(*) as emp_count 
from emp 
group by job_title;

-- Find the average salary by gender and department.
select gender,dept_id,
avg(salary) as average_salary 
from emp 
group by gender ,dept_id;


-- having 

-- Find the department with more than 3 employees.
select dept_id , 
count(*) as emp_count
from emp 
group by dept_id 
having emp_count > 3  ;

-- Find job titles with an average salary greater than 75,000.
select job_title,
avg(salary) as average_salary
from emp  
group by job_title
having average_salary>75000;

-- Find job titles that have more than 2 employees and an average salary less than 80,000.
select job_title , 
count(*) as emp_count , avg(salary) as avg_sal 
from emp 
group by job_title 
having emp_count > 2 and avg_sal < 80000 ;

-- List job titles where the maximum salary is greater than 90,000.
select job_title, 
max(salary) as maximum_salary 
from emp 
group by job_title 
having maximum_salary>90000;

-- Show departments where the average salary of female employees is greater than 70,000.
select dept_id, gender, 
avg(salary) as avg_sal 
from emp 
group by dept_id,gender 
having avg_sal>70000 and gender ="F";


select * from emp ;
-- order by  -- limit 

-- Get the top 3 highest-paid employees
select * 
from emp 
order by salary desc limit 3;

-- Get the 5 most recently hired employees 
select * 
from emp 
order by hire_date desc limit 5;
 
 -- recently hired 3 devlopers 
 select * 
 from emp 
 where job_title="developer" 
 order by hire_date desc limit 3;

-- Show the lowest 3 salaries in the compan
select * 
from emp 
order by salary Asc 
limit 3 ;


-- Show the top 4 highest-paid developers
select * 
from emp 
where job_title="developer" 
order by salary desc 
limit 4;


