
-- inner join
CREATE TABLE Employee (empid INT, empName TEXT, departmentid INT);
CREATE TABLE Department ( departmentid INT, depName TEXT);

INSERT INTO Employee VALUES
(1, 'TOM', 10),
(2, 'PETER', 20),
(3, 'NAVEEN', 30),
(4, 'LISA', 40);

INSERT INTO Department VALUES
(10, 'HR'),
(20, 'ADMIN'),
(30, 'FINANCE');

SELECT * FROM Employee;
SELECT * FROM Department;

TRUNCATE TABLE Employee;
TRUNCATE TABLE Department;

SELECT e.empid, e.empName, e.departmentid, d.depName 
FROM Employee e 
INNER JOIN Department d ON e.departmentid = d.departmentid;

-- left join/ left outer join
CREATE TABLE LOAN (loanNo TEXT, branch TEXT, amount INT);
CREATE TABLE CUSTOMER (custName TEXT, loanNo TEXT);

INSERT INTO LOAN VALUES
('L1', 'Pune', 1000),
('L2', 'Mumbai', 2000),
('L3', 'Bangalore', 3000);

INSERT INTO CUSTOMER VALUES
('Naveen', 'L1'),
('Tom', 'L2'),
('Lisa', 'L4');

SELECT * FROM LOAN;
SELECT * FROM CUSTOMER;

SELECT l.loanNo, l.branch, l.amount, c.custName 
FROM LOAN l 
LEFT JOIN CUSTOMER c ON l.loanNO = c.loanNo;
-- OR --
SELECT l.loanNo, l.branch, l.amount, c.custName 
FROM LOAN l 
LEFT OUTER JOIN CUSTOMER c ON l.loanNO = c.loanNo;

SELECT l.loanNo, l.branch, l.amount, c.custName 
FROM LOAN l 
LEFT JOIN CUSTOMER c ON l.loanNO = c.loanNo
WHERE l.amount <=2000;

-- right /right outer join
SELECT C.loanNo, l.branch, l.amount, c.custName 
FROM LOAN l 
RIGHT OUTER JOIN CUSTOMER c ON c.loanNO = l.loanNo;

SELECT l.loanNo, l.branch, l.amount, c.custName 
FROM LOAN l 
LEFT OUTER JOIN CUSTOMER c ON c.loanNO = l.loanNo;

-- full Outer Join 
CREATE TABLE Fruit (fid INT, fName TEXT, Bk_id INT);
CREATE TABLE Basket (Bk_id INT, Bk_Name TEXT);

INSERT INTO Fruit VALUES
(1, 'apple', 1),
(2, 'orange', 1),
(3, 'banana', 2),
(4, 'strawberry', NULL);

INSERT INTO Basket VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

SELECT * FROM Fruit;
SELECT * FROM Basket;

SELECT f.fid, f.fName, f.Bk_id, b.Bk_Name 
FROM Fruit f 
LEFT JOIN Basket b
ON f.Bk_id = b.Bk_id
UNION
SELECT f.fid, f.fName, b.Bk_id, b.Bk_Name 
FROM Fruit f 
RIGHT JOIN Basket b
ON f.Bk_id = b.Bk_id;
