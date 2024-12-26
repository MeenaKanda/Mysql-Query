use mydb;
select * from employeeinfo;
UPDATE employeeinfo SET Team ='Finance' WHERE `First Name` ='Douglas';
ROLLBACK;

select upper('meena');
select lower('KANDA');

select `first name` from employeeinfo;
select gender from employeeinfo;

select upper(First Name) from employeeinfo;
select upper(gender) from employeeinfo;
select upper(Senior Management) from employeeinfo;

select * from employees;
select upper(first_name) from employees;
select lower(email) from employees;

select length('meena');
select length(first_name) from employees;
select first_name from employees where length(first_name)=6;
select * from employees where length(first_name)=6;
select first_name, last_name, email from employees where length(last_name)=6;

select trim(' meena ');
select trim(' ' from ' meena ');
select trim('z' from 'zzmeenazz');

select instr('meena','e');
select instr('samriddhi ', ' ');

select substr('meenakshi', 3,5);
select substr(' meenakshi', 3,5); 
select substring('tanish', 3,3);

select substring(first_name, 1,3) from employees;
select substring(first_name, 1,5) from employees;
select first_name from employees where substring(first_name,1,1)='N';

select concat('pavan', 'training');
select concat('pavan', ' ', 'training');
select concat(first_name, ' ', last_name) from employees;
select concat(first_name, ' ', last_name)FULL_NAME from employees;


select abs(-50);
select abs(-55.5);

select sqrt(25);
select sqrt(29);

select mod(10,3);  -- reminder
select mod(27,6);

select power(2,2);
select power(2,5);
select power(3,3);
select power(10,10);

select truncate(3456.76894,3);
select truncate(3456.76894,2);
select truncate(3456.76894,1);
select truncate(3456.76894,-1);
select truncate(3456.76894,-2);
select truncate(3456.76894,-3);

select greatest(100,500,300,400,200);
select least(100,500,300,400,200);

select * from employees; 
select max(salary) from employees; 

select curdate();
select current_date();

select curtime();
select current_time();

select now();
select sysdate();

select day("2024-12-30");
select day('2024-2-1');
select year('2024-3-23');
select month('2022-6-12');
select monthname('2022-6-12');

select * from employees; 

select str_to_date("17,Sep,03",'%d,%M,%Y%');

select str_to_date(hire_date, '%d-%M-%Y') from employees;
select * from employees where year(str_to_date(hire_date,'%d-%M-%Y'))=2006;
select * from employees where month(str_to_date(hire_date,'%d-%M-%Y'))= 3;
select * from employees where day(str_to_date(hire_date, '%d-%M-%Y')) =17;

select avg(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;

select count(salary) from employees;
select count(distinct salary) from employees;
select count(*) from employees;













