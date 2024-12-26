create table Tab1(NUMID int(2));
describe Tab1;
insert into Tab1 values(10);
insert into Tab1 values(11);
insert into Tab1 values(12);
insert into Tab1 values(14);
select * from Tab1;

create table Tab2(NUMID int(2));
describe Tab2;
insert into Tab2 values(11);
insert into Tab2 values(12);
insert into Tab2 values(13);
insert into Tab2 values(15);
select * from Tab2;

select * from Tab1 inner join Tab2 on Tab1.numid = Tab2.numid;
select * from Tab1 left join Tab2 on Tab1.numid = Tab2.numid;
select * from Tab1 right join Tab2 on Tab1.numid = Tab2.numid;
select Tab1.numid from Tab1 inner join Tab2 on Tab1.numid = Tab2.numid;
select Tab1.numid from Tab1 left join Tab2 on Tab1.numid = Tab2.numid;
select Tab2.numid from Tab1 left join Tab2 on Tab1.numid = Tab2.numid;

select * from employees;
select * from employeeinfo;
select * from employeetable;

select * from employees inner join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;
select * from employees right join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;
select * from employees left join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;

select employees.DEPARTMENT_ID, employeetable.DEPARTMENT_ID, employees.FIRST_NAME from employees inner join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;
select employees.DEPARTMENT_ID, employeetable.DEPARTMENT_ID, employees.FIRST_NAME from employees left join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;
select employees.DEPARTMENT_ID, employeetable.DEPARTMENT_ID, employees.FIRST_NAME from employees right join employeetable on employees.DEPARTMENT_ID=employeetable.DEPARTMENT_ID;


select * from employees;
select E.employee_id, M.manager_id, E.first_name from employees E, employees M where E.EMPLOYEE_ID = M.MANAGER_ID;
select E.employee_id, M.manager_id, E.first_name from employees E, employees M where E.EMPLOYEE_ID <> M.MANAGER_ID;