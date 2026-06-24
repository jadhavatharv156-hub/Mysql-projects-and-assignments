create database Aggregate_function ;
use Aggregate_function ;

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10, 2),
    job_title VARCHAR(50),
    hire_date DATE,
    status VARCHAR(20) 
);

INSERT INTO emp(emp_id,emp_name,department,salary,job_title,hire_date,status) VALUES
(1, 'Alice Johnson', 'HR', 55000.00, 'HR Executive', '2020-01-15', 'Active'),
(2, 'Bob Smith', 'IT', 75000.00, 'Software Engineer', '2019-03-20', 'Active'),
(3, 'Charlie Lee', 'Sales', 62000.00, 'Sales Executive', '2021-06-11', 'On Leave'),
(4, 'Diana Prince', 'IT', 95000.00, 'Team Lead', '2018-09-23', 'Active'),
(5, 'Ethan Hunt', 'Finance', 67000.00, 'Analyst', '2022-01-02', 'Active'),
(6, 'Fiona Clark', 'HR', 59000.00, 'HR Manager', '2020-05-17', 'Resigned'),
(7, 'George Ray', 'Sales', 48000.00, 'Sales Trainee', '2023-02-08', 'Active'),
(8, 'Hannah Kim', 'IT', 87000.00, 'DevOps Engineer', '2021-12-01', 'Active'),
(9, 'Ian Black', 'Finance', 71000.00, 'Senior Analyst', '2019-08-13', 'On Leave'),
(10, 'Jackie Chan', 'IT', 80000.00, 'Software Engineer', '2020-11-20', 'Active'),
(11, 'Kelly Wong', 'Sales', 52000.00, 'Sales Executive', '2022-03-25', 'Resigned'),
(12, 'Liam Brown', 'HR', 50000.00, 'Recruiter', '2021-04-14', 'Active'),
(13, 'Mona Lisa', 'Finance', 75000.00, 'Accountant', '2019-07-30', 'Active'),
(14, 'Nathan Drake', 'IT', 66000.00, 'Support Engineer', '2023-01-10', 'Active'),
(15, 'Olivia Stone', 'Sales', 47000.00, 'Sales Assistant', '2023-05-19', 'Active');

select * from emp;

select min(salary) as Minimum_salary,
max(salary) as maximum_salary,
avg(salary) as average_salary,
sum(salary) as total_salary
from emp;

select min(hire_date) as First_Joiner,
max(hire_date) as Recent_Joiner
from emp;
 select count(*) as emp_count from emp;