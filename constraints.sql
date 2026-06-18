create database constraints;
use constraints;

create table batch (
student_id int auto_increment primary key , -- done 
Name varchar(25) not null , 
Age int check (Age <= 18 ) ,
City varchar(25) default("Pune"),  -- done 
Gmail varchar(50) unique ) ;

select * from batch ;
