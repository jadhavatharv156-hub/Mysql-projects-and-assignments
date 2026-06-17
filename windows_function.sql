create database windows_function;
use windows_function;
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    HireDate varchar(20) 
);

INSERT INTO Employees VALUES
(1, 'Alice', 'Smith', 'HR', 50000, '2020-01-15'),
(2, 'Bob', 'Johnson', 'IT', 70000, '2019-03-10'),
(3, 'Charlie', 'Lee', 'Finance', 65000, '2021-06-25'),
(4, 'Diana', 'King', 'IT', 72000, '2018-07-12'),
(5, 'Evan', 'Taylor', 'HR', 52000, '2022-02-01'),
(6, 'Fiona', 'Brown', 'Finance', 63000, '2019-12-05'),
(7, 'George', 'White', 'IT', 71000, '2020-09-17'),
(8, 'Helen', 'Davis', 'HR', 51000, '2021-04-20'),
(9, 'Ian', 'Clark', 'Finance', 64000, '2017-11-30'),
(10, 'Jane', 'Adams', 'IT', 73000, '2016-05-14');

select * from employees ;


-- Row_number 
-- rank 
-- densrank 


--   Assign a unique row number to each employee, ordered by salary descending .


select * , 
row_number() over(order by salary desc) as RowNumber
from employees ;

--  Assign a rank to each employee, ordered by salary Ascending .

select * , 
Rank() over ( order by Salary Asc) As Rank_Number 
from employees ;

--   What is the rank of emplodyees based on salary with each department

select * , 
row_number() over(order by salary desc) as RowNumber,
rank() over(partition by department order by salary Desc) as EMp_rank_Dept_Wise 
from employees ;

select * ,
avg(salary) over(partition by department ) as avg_dept_saL ,
salary - avg(salary) over (partition by department) as avg_sal_diff,
min(salary) over (partition by department) as min_sal_diff,
salary- min(salary) over (partition by department) as avg_min_sal_diff,
max(salary) over (partition by department) as max_sal_diff,
salary- max(salary) over (partition by department) as avg_max_sal_diff
from employees ;


select * ,
case 
when avg_sal_diff > 0 then "yes"
when avg_sal_diff < 0 then "NO"
else "None"
end as salary_category_diff
from 
(select * ,
salary - avg(salary) over (partition by department) as avg_sal_diff
from employees) as xyz;


-- by using view
create view tt as 
select * ,
salary - avg(salary) over (partition by department) as avg_sal_diff
from employees;

(select * ,
case 
when avg_sal_diff > 0 then "yes"
when avg_sal_diff < 0 then "NO"
else "None"
end as salary_category_diff 
from tt);



