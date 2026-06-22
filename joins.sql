create database joins_part_1 ;
use joins_part_1 ;



CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50)
);

CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(50),
    Score INT,
    ExamDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    Instructor VARCHAR(50),
    Credits INT
);



INSERT INTO Students VALUES
(1, 'Alice', 20, 'Female', 'Delhi'),
(2, 'Bob', 21, 'Male', 'Mumbai'),
(3, 'Charlie', 19, 'Male', 'Delhi'),
(4, 'Daisy', 20, 'Female', 'Chennai'),
(5, 'Eve', 22, 'Female', 'Kolkata'),
(6, 'Frank', 23, 'Male', 'Bangalore'),
(7, 'Grace', 20, 'Female', 'Hyderabad'),
(8, 'Hank', 21, 'Male', 'Mumbai'),
(9, 'Ivy', 22, 'Female', 'Delhi'),
(10, 'Jack', 20, 'Male', 'Pune');


INSERT INTO Marks VALUES
(101, 1, 'Math', 85, '2025-06-01'),
(102, 2, 'Science', 78, '2025-06-01'),
(103, 3, 'English', 90, '2025-06-01'),
(104, 4, 'Math', 92, '2025-06-01'),
(105, 5, 'Science', 65, '2025-06-01'),
(106, 6, 'English', 70, '2025-06-01'),
(107, 1, 'Science', 80, '2025-06-01'),
(108, 3, 'Math', 75, '2025-06-01'),
(109, 8, 'English', 88, '2025-06-01'),
(110, 10, 'Science', 60, '2025-06-01');

INSERT INTO Courses VALUES
(201, 1, 'Data Science', 'Dr. A', 4),
(202, 2, 'Physics', 'Dr. B', 3),
(203, 3, 'English Literature', 'Dr. C', 2),
(204, 4, 'Math', 'Dr. D', 3),
(205, 5, 'Biology', 'Dr. E', 3),
(206, 6, 'History', 'Dr. F', 2),
(207, 7, 'Programming', 'Dr. G', 4),
(208, 9, 'Statistics', 'Dr. H', 4),
(209, 10, 'Chemistry', 'Dr. I', 3),
(210, 3, 'Philosophy', 'Dr. J', 2);






select * from courses ;
select * from marks ;
select * from students ;

-- inner join 

-- Q1. List student names and their score from the Marks table.
select S.Name , M.Score 
from students S 
inner join Marks M on S.studentid = M.studentid ;

-- Q2. Get students and the courses they are enrolled in.
select S.name , C.coursename
from students S 
inner join courses C on S.studentid = C.studentid ;

-- left join 
 
-- Get all students and their exam scores, even if they didn’t appear for any exam.

select S.name , M.score 
from students S 
left join marks M on S.studentid = M.studentid ;

-- Get all students and their course names (if any).
select S.name , C.coursename
from students S 
left join courses C on S.studentid = C.studentid;


-- RIGHT JOIN

-- Get all scores and student names (if available).

select M.score , S.name 
from Marks M
right join students S on S.studentid = M.studentid ;

-- Get all course names and student names (if any).
select C.coursename , S.name 
from courses C 
right join students S on S.studentid = C.studentid;