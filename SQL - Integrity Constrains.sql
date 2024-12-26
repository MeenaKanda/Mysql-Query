-- not null
create Table student1(sno int(3) NOT NULL,
					  sname varchar(10), 
					  marks int(3));
describe student1;
insert into student1 values(10, 'Ram', 100);
insert into student1 values(NULL, 'lakshman', 99);
insert into student1 values(34, 'somu', 55);
insert into student1 values(12, NULL, 22);
select * from student1;
insert into student1(sno, sname) values( 15,'jonny');

-- unique
create table student2
(sno int(3) unique, 
sname varchar(10) unique, 
marks int(3));
describe student2;
drop table student2;

create table student2
(sno int(3), 
sname varchar(10), 
marks int(3),
unique(sno,sname,marks));

insert into student2 values(1, 'Raman', 100);
insert into student2 values(1, 'priya', 100);
insert into student2 values(10, 'Raman', 99);
insert into student2 values(10, 'Raman', 90);
insert into student2 values(null, 'Lakshmi', 55);
insert into student2 values(10, NULL, 22);
select * from student2;
describe student2;

-- primary key
create table student3
(sno int(3) primary key, 
sname varchar(10), 
marks int(3));
describe student3;
drop table student3;

create table student3
(sno int(3), 
sname varchar(10), 
marks int(3),
primary key(sno,sname));

drop table student3;
insert into student3 values(1, 'Raman', 100);
insert into student3 values(1, 'priya', 100);
insert into student3 values(10, 'Raman', 99);
insert into student3 values(10, 'Raman', 90);
insert into student3 values(null, 'Lakshmi', 55);
insert into student3 values(10, NULL, 22);
select * from student3;

-- foreign constrain
create table school(   -- parent
sno int(3), 
sname varchar(15), 
marks int(3), 
primary key(sno));

describe school;

insert into school values(101, 'arun', 90);
insert into school values(102, 'kiran', 70);
insert into school values(103, 'amit', 80);
select * from school;

create table library(   -- child
                     sno int(3), foreign key(sno) references school(sno), 
                     book_name varchar(10));
 describe library;                    
                    
insert into library values(102, 'java');
select * from library;
insert into library values(103, 'c');
insert into library values(108, 'python');
insert into library values(null, 'dotnet'); -- valid

delete from school where sno=102;
select * from school;

delete from library where sno=102;
select * from library;

-- on delete cascade
create table school1(   -- parent
sno int(3), 
sname varchar(15), 
marks int(3), 
primary key(sno));
describe school1;

insert into school1 values(101, 'arun', 90);
insert into school1 values(102, 'kiran', 70);
insert into school1 values(103, 'amit', 80);
select * from school1;

create table library1(   -- child
                     sno int(3), foreign key(sno) references school1(sno) on delete cascade, 
                     book_name varchar(10));
 describe library1;  
 drop table library1;
                    
insert into library1 values(102, 'java');
insert into library1 values(103, 'c');
insert into library1 values(null, 'dotnet'); -- valid
select * from library1;

delete from school1 where sno=103;

-- check constrain
create table school2(   -- parent
sno int(3), 
sname varchar(15), 
marks int(3), check(marks between 50 and 100)); -- marks <50 and marks>100
describe school2;

insert into school2 values(101, 'arun', 90);
insert into school2 values(102, 'kiran', 40); -- invalid
insert into school2 values(103, 'amit', 110);  -- invalid
select * from school2;

create table location(
city varchar(15) check(city in('HYDRABAD', 'CHENNAI', 'DELHI')),
country varchar(10),
pin int(8));
describe location;

insert into location values('HYDRABAD','INDIA', 3457689);
insert into location values('MUMBAI','INDIA', 63928209); -- invalid
insert into location values('DELHI','INDIA', 984736389);
select * from location;

-- default constraint
create table orders( 
id int(3),
orderNumber int(5),
orderDate datetime DEFAULT now());
describe orders;
select now();

insert into orders values(23, 345678, '2024-10-12 15:19:46'); -- enter time manually
insert into orders (id, orderNumber) values(34, 879368); -- default time value will be applied
insert into orders (id, orderNumber) values(55, 653782);
select * from orders;





















