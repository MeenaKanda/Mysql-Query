USE lucky_shrub;
show tables;
select * from orders;

CREATE TABLE Dep_Orders(
OrderID INT, 
Department VARCHAR(100), 
OrderDate DATE, 
OrderQty INT, 
OrderTotal INT, 
PRIMARY KEY(OrderID));

INSERT INTO Dep_Orders VALUES
(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
(4,'Trees and Shrubs','2022-06-01',15,400),
(5,'Garden Decor','2022-06-10',2,1250),
(6,'Lawn Care','2022-06-10',12,500),
(7,'Decking','2022-06-25',150,1450),
(8,'Compost and Stones','2022-05-29',20,780),
(9,'Trees and Shrubs','2022-06-10',15,400),
(10,'Garden Decor','2022-06-10',2,1250),
(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),
(13,'Compost and Stones','2022-05-30',15,700),
(14,'Trees and Shrubs','2022-06-15',10,300),
(15,'Garden Decor','2022-06-11',2,1250),
(16,'Lawn Care','2022-06-10',12,500),
(17,'Decking','2022-06-25',150,1450),
(18,'Trees and Shrubs','2022-06-10',15,400),
(19,'Lawn Care','2022-06-10',12,500),
(20,'Decking','2022-06-25',150,1450),
(21,'Decking','2022-06-25',150,1450);

SELECT * FROM Dep_Orders;

-- Task 1: Write a SQL SELECT statement to group all records that have the same order date.
SELECT OrderDate FROM Dep_Orders 
GROUP BY OrderDate;

SELECT OrderDate, COUNT(OrderDate) FROM Dep_Orders 
GROUP BY OrderDate;

-- Task 2: Write a SQL SELECT statement to retrieve the number of orders placed on the same day.
SELECT OrderDate, COUNT(OrderID) AS "No Of Orders" FROM Dep_Orders 
GROUP BY OrderDate;

-- Task 3: Write a SQL SELECT statement to retrieve the total order quantities placed by each department.

SELECT Department, SUM(OrderQty) AS "Total Quantity"
FROM Dep_Orders 
GROUP BY Department;

-- Task 4: Write a SQL SELECT statement to retrieve the number of orders placed on the same day between the following dates: 
-- 1st June 2022 and 30th June 2022.
SELECT OrderDate, COUNT(OrderId) FROM Dep_Orders
GROUP BY OrderDate 
HAVING OrderDate BETWEEN "2022-06-1" AND "2022-06-30";

show tables;
select * from employees;
SELECT * FROM Dep_Orders;
select * from employee_orders;


-- ------===================   ====================   ============================ ==================
-- ANY & ALL OPERATOR -----

CREATE TABLE employee_orders (
 OrderID int NOT NULL,
 EmployeeID int NOT NULL,
 Status VARCHAR(150),
 HandlingCost int DEFAULT NULL,
 PRIMARY KEY (EmployeeID,OrderID),
 FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID));


INSERT INTO employee_orders
VALUES(1,3,"In Progress",200), 
(1,5,"Not Recieved",300), 
(1,4,"Not Recieved",250), 
(2,3,"Completed",200), 
(2,5,"Completed",300), 
(2,4,"In Progress",250), 
(3,3,"In Progress",200), 
(3,5,"Not Recieved",300), 
(3,4,"Not Recieved",250), 
(4,3,"Completed",200), 
(4,5,"In Progress",300), 
(4,4,"In Progress",250), 
(5,3,"Completed",200), 
(5,5,"In Progress",300), 
(5,4,"Not Recieved",250), 
(11,3,"Completed",200), 
(11,5,"Completed",300), 
(11,4,"Not Recieved",250), 
(14,3,"Completed",200), 
(14,5,"Not Recieved",300), 
(14,4,"Not Recieved",250); 


-- Task1: Use the ANY operator to identify all employees with the Order Status status 'Completed'.



SELECT EmployeeID FROM employees 
WHERE EmployeeID = ANY( SELECT EmployeeID FROM employee_orders WHERE Status = "Completed");

-- Task 2: Use the ALL operator to identify the IDs of employees who earned a handling cost of 
-- "more than 20% of the order value" from all orders they have handled.

SELECT EmployeeID, HandlingCost FROM employee_orders WHERE HandlingCost > 
ALL ( SELECT (OrderTotal/100*20) AS "20% Order"  FROM Dep_Orders); 

-- Task 3: Use the GROUP BY clause to summarize the duplicate records with the same column values 
-- into a single record by grouping them based on those columns.
SELECT EmployeeID, HandlingCost FROM employee_orders WHERE HandlingCost > 
ALL ( SELECT (OrderTotal/100*20) AS "20% Order"  FROM Dep_Orders) GROUP BY EmployeeID, HandlingCost; 


-- Task 4: Use the HAVING clause to filter the grouped data in the subquery that 
-- you wrote in task 3 to filter the 20% OrderTotal values to only retrieve values that are more than $100.

SELECT EmployeeID, HandlingCost FROM employee_orders WHERE HandlingCost > 
ALL ( SELECT ROUND(OrderTotal/100*20) AS T FROM Dep_Orders GROUP BY OrderTotal HAVING T > 100)
GROUP BY EmployeeID, HandlingCost; 

select * from employees;
SELECT * FROM Dep_Orders;
select * from employee_orders;
