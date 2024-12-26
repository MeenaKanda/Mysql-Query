select * from employees;

select salary from employees where first_name = 'Daniel'; -- 9000
select salary from employees where salary < 9000; 
select salary from employees where salary <(select salary from employees where first_name = 'Daniel');
select salary from employees where salary >(select salary from employees where first_name = 'Daniel');
select first_name, salary from employees where salary <(select salary from employees where first_name = 'Daniel');
select * from employees where salary <(select salary from employees where first_name = 'Daniel');

-- find max num and 2nd max number ---- single row sub query
select max(salary) from employees;
select max(salary) from employees where salary < (select max(salary) from employees);  -- 2nd max
select max(salary) from employees where salary < (select max(salary) from employees where salary < (select max(salary) from employees)); -- 3rd max number

-- single row sub query
select min(salary) from employees;
select min(salary) from employees where salary > (select min(salary) from employees); -- 2nd min #
select min(salary) from employees where salary >(select min(salary) from employees where salary > (select min(salary) from employees)); -- 3rd min #


-- find the salary of employees whose salary is greater than the salary of employee whose employee_id= 206
select salary from employees where EMPLOYEE_ID =206;
select salary from employees where salary >(select salary from employees where EMPLOYEE_ID =206);


-- display employees whose are all turning the highest salary
select max(salary) from employees where salary = (select max(salary) from employees);



-- Multi Row sub Query
-- Display the employees whose salary is equal to the salary of atleast one employee in department id = 50
 select salary from employees where department_id = 30;
 select salary from employees where salary in(select salary from employees where department_id = 50);
 select * from employees where salary in(select salary from employees where department_id=50);
 
 select salary from employees where salary >any(select salary from employees where department_id = 30);
 select * from employees where salary >any(select salary from employees where department_id = 30);
select salary from employees where salary <any(select salary from employees where department_id = 30);

select salary from employees where salary >all(select salary from employees where department_id = 30);
select salary from employees where salary <all(select salary from employees where department_id = 30);
select * from departments;


-- query to get department name of employee
SELECT e.first_name "First Name", e.last_name "Last Name", d.department_name AS "Department Name" 
  FROM employees e, departments d 
 WHERE e.department_id = d.department_id;

SELECT e.first_name "First Name", e.last_name "Last Name", d.department_name AS "Department Name" 
from employees e 
inner join departments d on d.department_id=e.department_id;

SELECT e.first_name "First Name", e.last_name "Last Name", d.department_name AS "Department Name" , j.job_desc as "Job Name"
from employees e 
inner join departments d on d.department_id=e.department_id
inner join jobs j on j.job_id = e.job_id;

select * from employees where job_id = 'PU_MAN';

select * from jobs

/*insert into jobs values ('AC_ACCOUNT', "Accountant");

insert into jobs values ('PU_MAN', "Manual");
insert into jobs values ('SH_CLERK', "Clerk");
insert into jobs values ('MK_REP', "Rep");
*/
select *
from employees e 
right join departments d on d.department_id=e.department_id;
select * from departments;

select count(*) from employees where department_id ;

update employees set department_id = 0 where employee_id = 140

-- list out employee who is having salary less than maximum salary and 
-- also having hire date greater than the hire data of an employee who is having an maximum salary

select first_name, salary, hire_date from employees where salary < (select max(salary) from employees) and hire_date > 
 (select hire_date from employees where salary = (select max(salary) from employees));
 
 -- IN---
 SELECT * FROM EMPLOYEES WHERE SALARY IN(2600, 6000,9000);
 SELECT * FROM EMPLOYEES WHERE SALARY IN(2600, 6000,9000) ORDER BY SALARY DESC;
 SELECT * FROM EMPLOYEES WHERE SALARY IN(2600, 6000,9000) ORDER BY SALARY ASC;
