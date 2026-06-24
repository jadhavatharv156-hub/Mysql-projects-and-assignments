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
inner join courses C on S.studentid = C.studentid;

-- Display the names of students who scored in Math and their course names.
select S.name , M.subject , C.coursename 
from students S 
inner join marks M on S.studentid = M.studentid
inner join courses C on M.studentid = C.studentid;

-- Find students enrolled in courses having more than 3 credits and display their scores.
select S.name , C.coursename , C.credits , M.score
from students S
inner join courses C on S.studentid = C.studentid
inner join marks M on C.studentid = M.studentid
where c.credits > 3;

-- Show the exam date and instructor for each student.
select M.examdate , c.instructor ,S.name
from marks M
inner join courses C on M.studentid = C.studentid
inner join students S on C.studentid = S.studentid;

-- List students who have both marks and course records.
select S.name , M.score , C.coursename
from students S 
inner join marks M on s.studentid = M.studentid
inner join courses C on M.studentid = C.studentid;

-- Show the instructor name and the student's score.
select C.instructor , M.score , S.name
from courses C 
inner join marks M on c.studentid = m.studentid 
inner join students S on M.studentid = S.studentid;

-- left join 
 
-- Get all students and their exam scores, even if they didn’t appear for any exam.
select S.name , M.score
from students S 
left join marks M on S.studentid = m.studentid;


-- Get all students and their course names (if any).
select S.name , C.coursename
from students S
left join courses C on S.studentid = C.studentid;


-- RIGHT JOIN

-- Get all scores and student names (if available).
select M.score , S.name 
from marks M
right join students S on m.studentid = s.studentid;
 

-- Get all course names and student names (if any).
select C.coursename , S.name 
from courses C 
right join students S on C.studentid = S.studentid;

-- CROSS JOIN 

-- Pair every student with every course.

select S.name ,C.coursename 
from students S 
cross join Courses C ;

-- Create combinations of each subject and student.
select M.subject , S.name
from marks M
cross join students S ;

-- part - 2 

-- Get names of students, their course instructors , and exam scores
Select S.name , C.instructor , M.SCore 
From students S 
join Courses C on S.Studentid = C.studentid 
join MArks M on C.studentid = M.studentid ;

-- List students who have scored in 'Math' along with their score.
Select S.name , M.Subject , M.score 
from Students S
join MArks M on S.studentid = M.studentid 
where M.subject = "Math";


-- List students from 'Delhi' who have scored more than 80 in any subject.
select S.name , M.score , S.city 
from students S 
join marks M on S.studentid = m.studentid
where S.city = "delhi" and m.score > 80;


--  Show all students and the courses they are enrolled in, but only if the course credits are more than 3.

select S.name , C.coursename , C.credits 
from students S 
join Courses C on S.studentId = C.studentid 
where C.credits > 3 ;

--  List names of male students and the subjects they appeared for.
select S.name , S.gender , M.subject
from students S 
join marks M on S.studentid - M.studentid
where S.gender = "male";


-- Pair every female student with every course that has 4 credits.

select S.name , S.gender , C.coursename , C.credits 
from Students S 
cross join courses C 
where S.gender = "Female" and C.credits >= 4 ;



-- practice 
-- Find students who have marks but are not enrolled in any course.
select S.name , M.score , C.coursename
from students S 
right join marks M on S.studentid = M.studentid
left join courses C on M.studentid = C.studentid;

-- Find students who have both a course and a score greater than 75.
select S.name , C.coursename , M.score 
from students S 
inner join courses C on S.studentid = C.studentid 
inner join Marks M on C.studentid = M.studentid
where C.coursename > 75 or M.score > 75 ;

-- Display students whose course instructor starts with 'Dr.' and score is above 80.
select S.name , C.instructor , M.score 
from students S 
inner join courses C on S.studentid = C.studentid
inner join Marks M on C.studentid = M.studentid
where M.score > 80 and C.instructor like "Dr%";

-- Find students who belong to Delhi and are enrolled in courses worth more than 3 credits.
select S.name , S.city , C.coursename , C.credits 
from students S 
inner join courses C on S.studentid = C.studentid 
where S.city = "delhi" and C.credits > 3 ;

-- Display student names, subjects, scores, course names, and instructors together.
select S.name , M.subject , M.score ,  C.coursename , C.instructor
from students S 
inner join marks M on S.studentid = M.studentid
inner join Courses C on M.studentid = C.studentid;