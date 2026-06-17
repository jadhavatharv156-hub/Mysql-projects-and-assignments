use basic;
create table Student_details(
std_id int,
student_name varchar(15),
Age int,
course varchar(20),
contact int,
qualification varchar(15),
city varchar(15)
);

select * from student_details;

insert into student_details value(1,"A",21,"Data science",1111111111,"graduate","pune");
insert into student_details value(2,"B",21,"Data analytics",222222221,"under graduate","pune");
insert into student_details value(3,"C",21,"Data science",333333333,"graduate","pune");
insert into student_details value(4,"D",21,"Data science",444444444,"graduate","satara");
insert into student_details value(5,"E",21,"DBMS",555555555,"graduate","pune");
insert into student_details value(6,"F",21,"DBMS",666666666,"graduate","mumbai");
insert into student_details value(7,"G",21,"SQL",777777777,"graduate","satara");
insert into student_details value(8,"H",21,"SQL",888888888,"graduate","pune");
insert into student_details value(9,"I",21,"Data analytics",999999999,"graduate","pune");
insert into student_details value(10,"J",21,"Data science",1010101010,"graduate","satara");

insert into student_details value(11,"A",21,"Data science",1234567890,"under graduate","pune");
insert into student_details value(12,"A",23,"Data science",1212121212,"post graduate","pune");
insert into student_details value(13,"A",21,"Data science",1313131313,"graduate","solapur");
insert into student_details value(14,"A",21,"SQL",1414141414,"under graduate","pune");
insert into student_details value(15,"A",29,"Data analytics",1515151515,"Phd","nashik");
insert into student_details value(16,"A",25,"Data analytics",1717171717,"post graduate","sangali");
insert into student_details value(17,"A",24,"SQL",1818181818,"graduate","pune");
insert into student_details value(18,"A",20,"DBMS",1919191919,"graduate","pune");
insert into student_details value(19,"A",18,"SQL",1111111111,"HSC","kolhapur");
insert into student_details value(20,"A",20,"DBMS",1111111111,"under graduate","dhule");

insert into student_details value(21,"U",21,"DBMS",2121212121,"graduate","pune");
insert into student_details value(22,"V",23,"SQL",232322323,"post graduate","dhule");
insert into student_details value(23,"W",20,"Data analytics",244242424,"under graduate","mumbai");
insert into student_details value(24,"X",30,"DBMS",252525252,"Phd","dhule");
insert into student_details value(25,"Y",22,"DBMS",262626266,"under graduate","mumbai");
insert into student_details value(26,"Z",24,"SQL",272727277,"graduate","nashik");
insert into student_details value(27,"AA",21,"Data analytics",228282828,"graduate","beed");
insert into student_details value(28,"AB",25,"Data science",292292929,"post graduate","satara");
insert into student_details value(29,"AC",19,"SQL",313131313,"under graduate","pune");
insert into student_details value(30,"AD",32,"SQL",323232322,"Phd","dhule");

insert into student_details value(31,"AE",21,"Data science",012232342,"graduate","pune");
insert into student_details value(32,"AF",33,"DBMS",323344322,"Phd","dhule");
insert into student_details value(33,"AG",23,"SQL",320000322,"post graduate","satara");
insert into student_details value(34,"AH",24,"DBMS",321111122,"post graduate","dhule");
insert into student_details value(35,"AI",19,"SQL",329745242,"under graduate","satara");
insert into student_details value(36,"AJ",20,"DBMS",213246852,"Phd","satara");
insert into student_details value(37,"AK",22,"SQL",353447162,"Phd","beed");
insert into student_details value(38,"AL",26,"Data analytics",427616482,"graduate","nashik");
insert into student_details value(39,"AM",30,"SQL",534343232,"Phd","dhule");
insert into student_details value(40,"AN",19,"Data science",534316878,"HSC","mumbai");

insert into student_details value(41,"AO",24,"DBMS",342786743,"graduate","satara");
insert into student_details value(42,"AP",19,"SQL",634689276,"HSC","dhule");
insert into student_details value(43,"AQ",20,"Data science",437895688,"under graduate","satara");
insert into student_details value(44,"AR",27,"SQL",533682754,"post graduate","pune");
insert into student_details value(45,"ROHIT",39,"CRICKET",45454545,"Phd","mumbai");

select * from student_details;
