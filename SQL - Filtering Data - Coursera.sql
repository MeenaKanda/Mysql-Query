USE lucky_shrub;
show tables;
DESCRIBE ORDERS;
SELECT * FROM orders;

-- Task 1: Write a SQL statement to print all records of orders where the cost is $250 or less. 
-- The expected output result should be the same as the following screenshot (assuming that you have populated the Orders table with the same data set)

SELECT * FROM orders 
WHERE Cost <= 250;

-- Task 2: Write a SQL statement to print all records of orders where the cost is between $50 and $750. The expected output result should be the same as the following screenshot 
-- (assuming that you have populated the orders table with the same data set)

SELECT * FROM orders
WHERE Cost BETWEEN 50 AND 750;  -- or
SELECT * FROM Orders WHERE Cost > 50 AND Cost < 750;

SELECT * FROM orders
WHERE Cost BETWEEN 50 AND 750
ORDER BY Cost DESC;

SELECT * FROM orders
WHERE Cost BETWEEN 50 AND 750
ORDER BY Cost DESC LIMIT 2;

-- Task 3: Write a SQL statement to print all records of orders that have been placed by the client with the id of Cl3 and
-- where the cost of the order is more than $100. The expected output result should be the same as the following screenshot 
-- (assuming that you have populated the Orders table with the same data set)
SELECT * FROM Orders
WHERE ClientID= "Cl3" AND Cost>100;

-- Task 4: Write a SQL statement to print all records of orders that have a product id of p1 or p2 and 
-- the order quantity is more than 2. The expected output result should be the same as the following screenshot 
-- (assuming that you have populated the Orders table with the same data set)

SELECT * FROM Orders 
WHERE  ProductID IN("P1","P2") AND Quantity >2; -- or
SELECT * FROM Orders WHERE ProductID = "P1" OR ProductID = "P2" AND Quantity > 2;

-- =====================   ===================  ========================

CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

SELECT * FROM employees;
-- Task 1: Use the AND operator to find employees who earn an annual salary of $50,000 or more attached to the Marketing department.
SELECT * FROM employees 
WHERE AnnualSalary >= 50000 AND Department = "Marketing";

-- Task 2: Use the NOT operator to find employees not earning over $50,000 across all departments.
SELECT * FROM employees WHERE NOT Annualsalary > 50000;

-- Task 3: Use the IN operator to find Marketing, Finance, and Legal employees whose annual salary is below $50,000. 
SELECT * FROM employees 
WHERE Department IN("Marketing", "Finance", "Legal") AND AnnualSalary < 50000;

-- Task 4: Use the BETWEEN operator to find employees who earn annual salaries between $10,000 and $50,000.
SELECT * FROM employees 
WHERE AnnualSalary BETWEEN 10000 AND 50000;

-- Task 5: Use the LIKE operator to find employees whose names start with ‘S’ and are at least 4 characters in length.
SELECT * FROM employees 
WHERE EmployeeName LIKE 'S____%';


      
