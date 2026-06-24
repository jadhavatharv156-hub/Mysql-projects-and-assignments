create database alter_commond;
use alter_commond;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade VARCHAR(10),
    EnrollmentDate DATE
);
INSERT INTO Student (StudentID, Name, Age, Grade, EnrollmentDate) VALUES
(1, 'Alice', 20, 'A', '2022-09-01'),
(2, 'Bob', 21, 'B', '2021-08-15'),
(3, 'Charlie', 19, 'A', '2022-01-10'),
(4, 'David', 22, 'C', '2020-07-20'),
(5, 'Eve', 20, 'B', '2023-02-25'),
(6, 'Frank', 23, 'C', '2019-09-05'),
(7, 'Grace', 21, 'A', '2022-04-10'),
(8, 'Heidi', 20, 'B', '2021-03-30'),
(9, 'Ivan', 22, 'D', '2020-06-12'),
(10, 'Judy', 19, 'A', '2023-01-01');

select * from student ;

--  ADD COLUMN

alter table Student 
add column gmail varchar(50) ;

--  DROP COLUMN

alter table student 
drop column gmail ;

--  RENAME COLUMN (Age_A)

alter table student 
rename column Age_A to Age ;

-- Update 

update Student 
set Grade = "D" 
where Name = "bob" ;


update student 
set Grade = "A"
where studentid = 8 ;



update student 
set grade = "A+"
where Grade = "A";

select * from Student ;

-- Delete

delete from student 
where Grade = "D" ;

-- Truncate 

truncate Student ;

-- Drop

drop table student ;

select * from student ;