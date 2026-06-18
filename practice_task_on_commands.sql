create database task;
use task;
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

-- Q1
-- 70k > A 
-- 70k to 60k -- B 
-- Else C

-- 1st way to solve
alter table emp 
add column salary_category varchar(20);

update emp
set salary_category = "A"
where salary > 70000 ;
update emp 
set salary_category = "B"
where salary between 60000 and 70000 ;
update emp 
set salary_category = "c"
where salary < 60000;

select * from emp;

-- 2nd way to solve
alter table emp
add column sal_cat varchar(5);

update emp 
set sal_cat = (
CASE 
when salary >= 70000 then 'A'
when salary between 60000 and  70000 then 'B'
else 'C'
end);

-- Q2
-- Display emp_name, department, and a column working_status:
-- If status = 'Active' → 'Working'
-- 'On Leave' → 'Temporarily Off'
--  Resigned → 'Left Company'

alter table emp
add column working_stat varchar(20);

update emp
set working_stat = (
case
when status="active" then "working"
when status="on leave" then "temporarily off"
else "left company"
end );
select * from emp;

alter table emp
drop column working_status;

-- Q3
-- Show employee name, department, add a new column bonus_eligible:
-- If salary > 70000 then 'Yes', else 'No'.

alter table emp
add column bonus_eligible varchar(20);

update emp 
set bonus_eligible = (
case 
when salary > 70000 then "yes" 
else "No"
end );
select * from emp;

-- Q4
-- Show emp_name and a column year_category:
-- hire_date year < 2020 → 'MAX_level'
-- year = 2020 or 2021 → 'Experienced'
-- Else → 'New Joiner'

alter table emp
add column year_category varchar(20);

update emp
set year_category = (
case 
when hire_date < "2020-01-01" then "Max_level"
When Hire_date between "2020-01-01" and "2021-12-31" then "Experienced"
else "New Joiner" 
end );
select * from emp;

-- Q5
--  Show employee name and a job_level column:
-- salary > 90000 → 'Senior'
-- 60000–90000 → 'Mid'
-- Else → 'Junior'

alter table emp
add column job_level varchar(10);

update emp 
set job_level = (
case 
when salary >90000 then "Senior"
when salary between 60000 and 90000 then "Mid"
else "Junior"
end
);
select * from emp;