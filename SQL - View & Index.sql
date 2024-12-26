use mydb;
select * from employees;
-- create view
create view employee_V1 as select first_name, salary, department_id from employees;
select * from employee_v1;
drop view employee_V1;

-- create index
select * from employees;
create index idx_employees on employees(first_name);
drop index idx_employees on employees;
