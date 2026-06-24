create database Basic_p1;

use Basic_p1 ;

CREATE TABLE Student (
    ID INT,
    Name VARCHAR(50),
    Age INT,
    Grade CHAR(1),
    Marks INT,
    Gender VARCHAR(10),
    City VARCHAR(50)
);

INSERT INTO Student (ID, Name, Age, Grade, Marks, Gender, City)
VALUES
(1, 'Alice', 17, 'A', 92, 'Female', 'New York'),
(2, 'Bob', 18, 'B', 78, 'Male', 'Chicago'),
(3, 'Charlie', 16, 'A', 88, 'Male', 'Houston'),
(4, 'Diana', 17, 'C', 65, 'Female', 'Los Angeles'),
(5, 'Ethan', 18, 'B', 81, 'Male', 'Seattle'),
(6, 'Fiona', 17, 'A', 95, 'Female', 'New York'),
(7, 'George', 16, 'C', 60, 'Male', 'Miami'),
(8, 'Hannah', 17, 'B', 74, 'Female', 'Boston'),
(9, 'Ian', 19, 'A', 90, 'Male', 'Chicago'),
(10, 'Jenny', 18, 'C', 68, 'Female', 'Dallas'),
(11, 'Kevin', 16, 'B', 79, 'Male', 'Seattle');
 select * from student;
 
 -- part 1 


-- 1. Find students who got grade 'A'.

select * 
from student 
where grade = "A" ;

-- 2. Find students who scored more than 80 marks.

select * 
from student 
where marks > 80 ;

-- 3. Find students who are younger than 17.
select * 
from student 
where age < 17 ;

-- 4. Find students who did not get grade 'B'.
select * 
from student 
where grade != "B";

-- 5. Find students who live in 'New York'.
select * 
from student 
where City="New York";



-- 6: Find all students age 18 or older.

select * 
from student 
where Age>=18;

-- 7: List students who are not from New York.

select * 
from student 
where City!="New York";

-- 8: Find students  who have marks less than 70.

select * 
from student 
where marks <= 70;

--   Find students with marks between 60 and 80.
select* 
from student 
where Marks between 60 and 70;


--   Find students with ID between 5 and 10.
select * 
from student 
where ID between 5 and 10;

--   Find students who got marks between 85 and 95.
select * 
from student 
where Marks between 85 and 95;

--  Find students whose age is between 17 and 18, or marks between 85 and 90 
select * 
from student 
where  Age between 17 and 18 or Marks between 85 and 90;

select * from student where  Age not between 17 and 18 and Marks not between 85 and 90;

-- part - 2

-- 4. Q: Find students who are 17 years old and scored more than 80.
select * 
from student 
where age = 17 and marks > 80 ;

-- 5. Q: Find male students who got grade A.
select * 
from student 
where grade = "A" and gender = "male" ;

--  Find students who scored between 75 and 85.
select * 
from student 
where marks >= 75 and marks <=85 ;

-- between --  and 

--  Find students who scored between 75 and 85.
select * 
from student 
where marks between 75 and 85 ;



--  Find students who are between 16 and 17 years old.
select * 
from student 
where age between 16 and 17 ;

--   Find students with marks between 60 and 80.
select * 
from student 
where Marks between 60 and 80;

--   Find students with ID between 5 and 10.
select * 
from student 
where ID between 5 and 10;

--   Find students who got marks between 85 and 95.
select * 
from student 
where marks between 85 and 95;

--  Find students whose age is between 17 and 18, or marks between 85 and 90 .
select * 
from student 
where Age between 17 and 18 or Marks between 85 and 90;

select* from student;


-- 1. Find all students whose names start with 'G'
select * 
from student 
where name like "G%";


-- 2. Find all students whose names end with 'a'

select * 
from student
where Name like "%a" ;

-- 3. Find all students whose names contain 'an'.

select * 
from Student 
where name like "%an%";

-- 4. Find all students from cities that start with 'N'.

select *
from student
where city like "N%" ; 

-- Find all students whose city contains the word 'York'.
select * 
from student 
where city like "%York%";

-- 5. Find all students whose grade is 'A'.

Select *
from student
where Grade like "A" ;


-- 7. Find all female students whose names end with 'a'.
select * 
from student 
where gender like "Female" and name like "%a";


-- 8. Find all students whose names have 'e' as the second letter.

select *
from student
where name like "_e%" ;

-- 9. Find all students whose city ends with 'go'.
select *
from student 
where city like "%go" ;

-- 10. Find all students whose names are exactly 5 characters long.
select * 
from Student 
where name like "_____";