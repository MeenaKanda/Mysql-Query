create table student4(
sno int(5) primary key auto_increment,
sname varchar(10),
mark int(3));

alter table student4 auto_increment=100;

describe student4;
insert into student4(mark, sname) values(88,'akash');
insert into student4(mark, sname) values(90,'balu');
insert into student4(mark, sname) values(77,'dhiyan');
select * from student4;

-- limit key word
select * from employees limit 5;
select * from employees limit 5,10;  -- start from 5th row it will count next 10 row

drop table student4;
                      
                       