create database basic;

use basic;
create table  student(
STD_ID int,
student_name varchar(15),
age int,
city varchar(15),
Mail varchar(50)
);

select * from student;

insert into student value(1,"karan",20,"Satara","karanp3341@gmail.com");

select * from student;
insert into student value(2,"varun",21,"pune","v@gmail.com");
insert into student value(3,"yash",19,"Satara","y@gmail.com");
insert into student value(4,"ayush",23,"uganda","a@gmail.com");
insert into student value(5,"atharv",24,"mumbai","at@gmail.com");

select * from student;

select STD_ID from student;
select STD_ID,age,city from student;


