use mydb;
DESC employees;

-- changing data type of hire_date column from text to date --
alter table employees add column hire_date1 date;
update employees set hire_date1=str_to_date(hire_date,'%d-%M-%Y%');
alter table employees drop column hire_date1;

ALTER TABLE employees ADD COLUMN aadhar_no VARCHAR(20);
ALTER TABLE employees MODIFY COLUMN aadhar_no INT;  -- modify column data type
ALTER TABLE employees CHANGE COLUMN aadhar_no pan_no INT; -- change column name
ALTER TABLE employees DROP COLUMN aadhar_no;
ALTER TABLE employees DROP COLUMN pan_no;

ALTER TABLE employees ADD COLUMN aadhar_no VARCHAR(20) DEFAULT 40000;
SELECT * FROM employees;

select * from employees;

SELECT * FROM employees WHERE HIRE_DATE BETWEEN '21-jun-07' AND '17-Sep-03'; -- INVALID
SELECT * FROM employees WHERE HIRE_DATE1 BETWEEN '17-Sep-03' AND '21-jun-07'; 
SELECT * FROM employees WHERE str_to_date(HIRE_DATE, '%d-%M-%Y%') not between str_to_date('17-Sep-03','%d-%M-%Y%') 
AND str_to_date('21-Jun-07','%d-%M-%Y%');

SELECT * FROM employees WHERE HIRE_DATE1 not between '2003-09-17' AND '2007-06-21';
SELECT * FROM employees WHERE HIRE_DATE1 not between '2003-09-17' AND '2007-06-21' ORDER BY HIRE_DATE1;
SELECT * FROM employees WHERE HIRE_DATE1 not between '2003-09-17' AND '2007-06-21' ORDER BY HIRE_DATE1 DESC;




SELECT * FROM employees WHERE FIRST_NAME BETWEEN 'a' AND 'c';
SELECT * FROM employees WHERE FIRST_NAME BETWEEN 'a' AND 'c' ORDER BY FIRST_NAME;
SELECT * FROM employees WHERE FIRST_NAME NOT BETWEEN 'a' AND 'c' ORDER BY FIRST_NAME;

-- WHERE Clause  used in SELECT UPDATE DELETE --
SELECT * FROM employees;

SELECT * FROM employees WHERE salary >13000;
UPDATE employees set salary = 5000 WHERE employee_id = 200;
DELETE FROM employees WHERE employee_id = 138;

-- HAVING Clause ----
SELECT department_id, AVG(salary), count(department_id) 
FROM employees 
WHERE department_id <>30 
GROUP BY department_id 
HAVING AVG(salary)>10000
ORDER BY department_id;
 

