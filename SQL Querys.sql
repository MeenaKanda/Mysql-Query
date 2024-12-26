

create database mydb;
use mydb;

create table Student(SNO int(5), SNAME varchar(15), MARK int(5));


describe Student;

select * from Student;
select SNAME from student;
select sno,mark from student;

insert into Student values(23,'RAM', 98);
insert into Student(SNAME, SNO, MARK) values('KIM', 14, 99);
insert into Student values(11,'LAKSH', 100);
insert into Student values(14, 'George', NULL);

delete from student where sname='RAM';

delete from student where mark is null;

-- create and copy new table from old
CREATE TABLE student_new SELECT * FROM student;
SELECT * FROM student_new;
DROP TABLE student_new;






