select * from employees;
select department_id, sum(salary) from employees group by department_id;
select department_id, avg(salary) from employees group by department_id;
select department_id, min(salary), max(salary) from employees group by department_id;
select department_id, count(*) from employees group by department_id;

select job_id, sum(salary) from employees group by job_id;
select job_id, count(*) from employees group by job_id;
select count(*) from employees;

select manager_id, count(*) from employees group by manager_id;
select manager_id, sum(salary), count(*) from employees group by manager_id;
select manager_id, sum(salary)TotalSalary, count(*)ManagerCount from employees group by manager_id;

select * from employees;
select job_id, department_id, count(*) from employees group by job_id, department_id;
select job_id, department_id, sum(salary) from employees group by job_id, department_id;
select job_id, department_id, avg(salary) from employees group by job_id, department_id;
select job_id, department_id, truncate(avg(salary),1) from employees group by job_id, department_id;
select job_id, department_id, truncate(avg(salary),0) from employees group by job_id, department_id;
select job_id, department_id, max(salary) from employees group by job_id, department_id;

select * from employees;

select department_id, count(*) from employees group by department_id;
select department_id, count(*) from employees group by department_id having count(*)>5;
select department_id, count(*) from employees group by department_id having count(*)<>6;

select department_id, sum(salary) from employees group by department_id having sum(salary)>25000;

select department_id, sum(salary) from employees where department_id<>50 group by department_id;
select department_id, sum(salary) from employees where department_id=50 group by department_id;
select department_id, sum(salary) from employees where department_id in(50,60) group by department_id;
select department_id, sum(salary) from employees where department_id not in(50,60) group by department_id;

select department_id, sum(salary) from employees where department_id>50 group by department_id having sum(salary)<25000;

select * from employees order by department_id;
select * from employees order by department_id asc;
select * from employees order by department_id desc;
select * from employees order by RAND();
select * from employees order by department_id limit 5;
select * from employees order by department_id asc limit 6;
select * from employees order by salary, first_name;
select * from employees order by salary desc, first_name;
select * from employees order by salary desc, first_name desc;
select first_name, salary from employees order by salary desc, first_name desc;
select * from employees order by salary desc;

select department_id, sum(salary) from employees group by department_id having sum(salary)>20000 order by sum(salary);
select department_id, sum(salary) from employees group by department_id having sum(salary)>20000 order by department_id;
select department_id, job_id, sum(salary) from employees group by department_id, job_id having sum(salary)>20000 order by sum(salary);
select department_id, job_id, sum(salary),count(job_id) from employees group by department_id, job_id order by department_id;


select department_id, sum(salary) from employees where department_id>50 group by department_id 
having sum(salary)>20000 order by sum(salary);

select department_id, sum(salary) from employees where department_id>50 group by department_id 
having sum(salary)>20000 order by department_id;

select * from employees;
SELECT department_id, sum(salary) FROM employees group by department_id having sum(salary)>8000;
SELECT department_id, sum(salary) FROM employees group by department_id having sum(salary)>8000 order by sum(salary) desc;
SELECT department_id, sum(salary) FROM employees group by department_id having sum(salary)>8000 order by sum(salary); -- default take asc order








