select * from studentdetails;

create table studentdetails(sno int(3), sname varchar(15));
describe studentdetails;
set sql_safe_updates=0;

insert into studentdetails values(3, 'Meena');
insert into studentdetails(sname,sno) values('kanda',5);
insert into studentdetails values(8, 'sammu');
insert into studentdetails values(1, 'tanish');
commit;
set autocommit =0;

select * from studentdetails;


delete from studentdetails where sid=3; 
select * from studentdetails;

delete from studentdetails;

commit;
rollback;

select * from studentdetails;
use mydb;


truncate table studentdetails;
drop table studentdetails;

rename table studentdetails to studentinfo;
rename table studentinfo to studentdetails;