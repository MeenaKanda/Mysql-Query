create table A(NUM int(4), GRADE varchar(2));
describe  A;
insert into  A values(11,'A');
insert into  A values(12,'B');
insert into  A values(13,'C');
insert into  A values(14,'D');
commit;
select * from A;

create table B(SNAME varchar(5), NUM int(3));
describe B;
insert into B values('ABC', 10);
insert into B values('XYZ', 11);
insert into B values('PQR', 12);
insert into B values('MNO', 14);
select * from B;

select num from A union select num from B;
select num from A union all select num from B;