create database joins_assign;
use joins_assign;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10), 
    class_id INT,
    city VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'Alice', 14, 'F', 101, 'New York'),
(2, 'Bob', 15, 'M', 101, 'Los Angeles'),
(3, 'Charlie', 13, 'M', 102, 'Chicago'),
(4, 'Diana', 14, 'F', 103, 'Houston'),
(5, 'Ethan', 15, 'M', 101, 'Phoenix'),
(6, 'Fiona', 14, 'F', 104, 'Philadelphia'),
(7, 'George', 13, 'M', 102, 'San Diego'),
(8, 'Hannah', 15, 'F', 104, 'Dallas'),
(9, 'Ian', 14, 'M', 103, 'San Jose'),
(10, 'Jane', 13, 'F', 101, 'Austin'),
(11, 'Kevin', 15, 'M', 105, 'Jacksonville'),
(12, 'Laura', 14, 'F', 105, 'San Francisco'),
(13, 'Mike', 13, 'M', 104, 'Columbus'),
(14, 'Nina', 15, 'F', 102, 'Charlotte') ,
(15, 'Oscar', 14, 'M', 103, 'Fort Worth');

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    section CHAR(1),
    room_no INT,
    teacher_id INT,
    year INT
);

INSERT INTO Classes VALUES
(101, 'Grade 8', 'A', 201, 1, 2024),
(102, 'Grade 8', 'B', 202, 2, 2024),
(103, 'Grade 9', 'A', 203, 3, 2024),
(104, 'Grade 9', 'B', 204, 4, 2024),
(105, 'Grade 10', 'A', 205, 5, 2024);


CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    gender VARCHAR(10)
);

INSERT INTO Teachers VALUES
(1, 'Mr. Smith', 'Math', '111-111-1111', 'smith@school.com', 'M'),
(2, 'Ms. Johnson', 'English', '222-222-2222', 'johnson@school.com', 'F'),
(3, 'Mr. Lee', 'Science', '333-333-3333', 'lee@school.com', 'M'),
(4, 'Mrs. Brown', 'History', '444-444-4444', 'brown@school.com', 'F'),
(5, 'Mr. Green', 'Physics', '555-555-5555', 'green@school.com', 'M');


CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    difficulty VARCHAR(10),
    duration INT,
    max_marks INT,
    teacher_id INT
);

INSERT INTO Subjects VALUES
(1, 'Math', 'Hard', 60, 100, 1),
(2, 'English', 'Medium', 45, 100, 2),
(3, 'Science', 'Hard', 50, 100, 3),
(4, 'History', 'Easy', 40, 100, 4),
(5, 'Physics', 'Hard', 60, 100, 5);


CREATE TABLE Student_Subjects (
    student_id INT,
    subject_id INT,
    marks INT,
    semester INT,
    status VARCHAR(10),
    exam_date DATE,
    PRIMARY KEY(student_id, subject_id)
);

INSERT INTO Student_Subjects VALUES
(1, 1, 85, 1, 'Pass', '2024-05-01'),
(2, 1, 78, 1, 'Pass', '2024-05-01'),
(3, 2, 90, 1, 'Pass', '2024-05-02'),
(4, 3, 88, 1, 'Pass', '2024-05-03'),
(5, 1, 76, 1, 'Pass', '2024-05-01'),
(6, 4, 92, 1, 'Pass', '2024-05-04'),
(7, 2, 81, 1, 'Pass', '2024-05-02'),
(8, 3, 85, 1, 'Pass', '2024-05-03'),
(9, 1, 67, 1, 'Pass', '2024-05-01'),
(10, 5, 74, 1, 'Pass', '2024-05-05'),
(11, 5, 80, 1, 'Pass', '2024-05-05'),
(12, 4, 90, 1, 'Pass', '2024-05-04'),
(13, 3, 88, 1, 'Pass', '2024-05-03'),
(14, 2, 86, 1, 'Pass', '2024-05-02'),
(15, 1, 79, 1, 'Pass', '2024-05-01');


CREATE TABLE Attendance (
    student_id INT,
    date DATE,
    status VARCHAR(10),
    period INT,
    recorded_by VARCHAR(50),
    remarks VARCHAR(100)
);

INSERT INTO Attendance VALUES
(1, '2024-06-01', 'Present', 1, 'Mr. Smith', ''),
(2, '2024-06-01', 'Absent', 1, 'Mr. Smith', 'Sick'),
(3, '2024-06-01', 'Present', 1, 'Ms. Johnson', ''),
(4, '2024-06-01', 'Present', 1, 'Mr. Lee', ''),
(5, '2024-06-01', 'Present', 1, 'Mr. Smith', ''),
(6, '2024-06-01', 'Absent', 1, 'Mrs. Brown', 'Leave'),
(7, '2024-06-01', 'Present', 1, 'Ms. Johnson', ''),
(8, '2024-06-01', 'Present', 1, 'Mr. Lee', ''),
(9, '2024-06-01', 'Present', 1, 'Mr. Smith', ''),
(10, '2024-06-01', 'Present', 1, 'Mr. Green', ''),
(11, '2024-06-01', 'Present', 1, 'Mr. Green', ''),
(12, '2024-06-01', 'Absent', 1, 'Mrs. Brown', 'Family Trip'),
(13, '2024-06-01', 'Present', 1, 'Mr. Lee', ''),
(14, '2024-06-01', 'Present', 1, 'Ms. Johnson', ''),
(15, '2024-06-01', 'Absent', 1, 'Mr. Smith', 'Late');



-- 1. List students with their class names.
select S.name , c.class_name 
from Students S 
join classes C on S.class_id = C.class_id ;

-- 2. Show each student and their city with the teacher assigned to their class.

select S.name , S.city , C.class_name , T.name 
from students S
join classes C on  S.class_id = C.class_id 
join teachers T on T.teacher_id = C.teacher_id ;

-- 3. List students with subject names they are enrolled in.
select s.name , ss.subject_id , sub. subject_name
from students S 
join student_subjects ss on s.student_id = ss.student_id 
join subjects sub on ss.subject_id = sub.subject_id;


-- 4. Get all students and their marks in Math.
select S.name , SS.marks , sub.subject_name
from students S 
join student_subjects SS on s.student_id = ss.student_id 
join subjects sub on ss.subject_id = sub.subject_id
where subject_name = "math";

-- 5. List students and their attendance status on 2024-06-01.
Select S.name , A.Status , A.date 
from students S 
left join attendance A on S.student_id = A.student_id ;

-- 6. Show class name and number of students in each class.
Select C.class_name,C.section, count(S.student_id) as student_count 
from classes C 
left join Students S on C.class_id = S.class_id 
group by C.class_name , C.section ;

select * from classes;

-- 7. Find students who got more than 85 marks in any subject.
select S.name , SS.marks , sub.subject_name
from students s 
join student_subjects ss on ss.student_id = S.student_id
join subjects Sub on ss.subject_id = sub.subject_id
where ss.marks > 85;

-- 8. List students along with subject names and their teacher.
select S.name ,ss. sub.subject_name ,t.name 
from students s 
join student_subjects ss on ss.student_id = s.student_id
join subjects sub on sub.subject_id=SS.subject_id
join teachers T on T.teacher_id=sub.teacher_id;

-- 9. Get students who are absent on 2024-06-01.
select S.name , A.date , A.status 
from students S
join attendance A on S.student_id = A.student_id 
where A.status = "Absent" and A.date = "2024-06-01" ;