create database store_procedure;
use store_procedure;

create table employee(
	Emp_Id int,
    Emp_name varchar(25),
    salary int
);

insert into employee values 
(1,"Atharv",45000),
(2,"Karan",55000),
(3,"Varun",65000);

select * from employee;

-- Basic 

call EnterID_ (2);

call enterid_ (1);

call enterid_ (3);

-- Advance

# insert

call add_emp (4 , "Yash" , 74000);

call add_emp (5 , "Ayush" , 83000);

# update

call update_salary (90000 , 2);

# delete

call remove_emp (3);
