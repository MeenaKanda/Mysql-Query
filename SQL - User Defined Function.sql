USE mydb;
select * from studentdetails;

create table studentdetails(sno int(3), sname varchar(15));
describe studentdetails;
set sql_safe_updates=0;
set autocommit =0;
insert into studentdetails values(3, 'Meena');
insert into studentdetails(sname,sno) values('kanda',5);
insert into studentdetails values(8, 'sammu');
insert into studentdetails values(1, 'tanish');
commit;
delete from studentdetails where sno=3;
rollback;
select * from studentdetails;
drop table studentdetails;
rollback;
select * from studentdetails;

select * from employees;
select max(salary) from employees;
select min(salary) from employees;
select sqrt(department_id) from employees;
select power(department_id,2) from employees;
select curdate();
select curtime();
select now();
select year(hire_date1) from employees;
select month(hire_date1) from employees;
select day(hire_date1) from employees;
select monthname(hire_date1) from employees;

select count(department_id) from employees;
select count(distinct salary) from employees;
select truncate(avg(salary),2) from employees;
select truncate(avg(salary),-2) from employees;
select greatest(salary) from employees;
select job_id from employees where length(substring(job_id,1,3)) = 3;
select concat(first_name,' ' ,last_name) from employees;
select upper(first_name) from employees;

select * from employees;

create function empsal(emp_id int) returns int(20)
deterministic
return(select salary from employees where EMPLOYEE_ID=emp_id);

select empsal(198);
drop function if exists empsal;
drop function if exists emp_fullName;
drop function if exists emp_Name;

show function status;

delimiter $$
create function emp_Name(emp_id int)
returns varchar(50)
deterministic
begin
declare fullname varchar(50);
select concat(first_name,' ',last_name) into fullname
from employees 
where employee_id=emp_id;
return fullname;
end $$


select emp_Name(employee_id) from employees;
select job_id,emp_Name(employee_id) 
from employees;

select * from employees;

delimiter $$
create function avg_sal1()
returns float
deterministic
begin
 declare averagesal float;
 select avg(salary) into averagesal
 from employees;
 return averagesal;
end $$
delimiter;

delimiter $$
create function avg_sal1()
returns float
deterministic
begin
 declare averagesal float;
 set averagesal = (select avg(salary) 
 from employees);
 return averagesal;
end $$
delimiter;

drop function if exists avg_sal1;
select avg_sal1();

-- get minimum sal employee name --
select * from employees;
delimiter $$
create function maxsal_name() 
returns varchar(40)
deterministic
begin 
declare empname varchar(40);
set empname= (select concat(first_name, ' ', last_name) from employees
where salary = (select min(salary)from employees));
return empname;
end $$

delimiter;

select maxsal_name();
drop function if exists maxsal_name;

(select concat(first_name, ' ', last_name) from employees
where salary = (select min(salary)from employees));

delimiter $$
create function hello(name varchar(50)) 
returns varchar(255)
deterministic
begin
return concat('hello ', name);
end $$ 
delimiter;
select hello("meena");
drop function if exists hello;

delimiter $$
create function getcustcreditlevel(creditamount int(50))
returns varchar(100)
deterministic
begin
declare c_level varchar(100);
if creditamount > 10000  THEN
set c_level = "PLATINUM";
ELSEIF creditamount >5000 <10000 then
set c_level = "GOLD";
ELSEIF creditamount < 5000 then
set c_level = "SILVER";
end if;
RETURN c_level;
end $$
delimiter ;

select getcustcreditlevel(10000);
drop function if exists getcustcreditlevel;

select * from employees;

delimiter $$
create function empsalLevel(sal int(20))
returns varchar(50)
deterministic
begin 
declare sal_level varchar(50);
if sal < 5000 then 
SET sal_level="LOW PAY";
ELSEIF (sal >=5000 and sal<=10000) then 
set sal_level = "MEDIUM PAY";
ELSEIF SAL > 10000 THEN
SET sal_level = "HIGH PAY";
ELSE
SET sal_level =" NO PAY";
END IF;
RETURN sal_level;
end $$
delimiter ;

select empsalLevel(10000);
select first_name, last_name, empsalLevel(salary) from employees;

delimiter $$
create function findSquare(number int(10))
returns int(40)
deterministic
begin
declare squ int(40);
set squ = number * number;
return squ;
end $$
delimiter;
select findSquare(200);


