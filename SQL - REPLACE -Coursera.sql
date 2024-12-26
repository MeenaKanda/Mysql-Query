-- REPLACE operator --
CREATE DATABASE IF NOT EXISTS little_lemon;
USE little_lemon;
CREATE TABLE Orders (
OrderID INT NOT NULL PRIMARY KEY, 
ClientID VARCHAR(10), ProductID VARCHAR(10), 
Quantity INT, Cost DECIMAL(6,2));

INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
VALUES (1, "Cl1", "P1", 10, 500), 
(2, "Cl2", "P2", 5, 100), 
(3, "Cl3", "P3", 20, 800), 
(4, "Cl4", "P4", 15, 150), 
(5, "Cl3", "P3", 10, 450), 
(6, "Cl2", "P2", 5, 800), 
(7, "Cl1", "P4", 22, 1200), 
(8, "Cl1", "P1", 15, 150);

SELECT * FROM Orders;

-- Task 1 solution: Write a SQL REPLACE statement that inserts two new orders with the following details: 
-- Order 9 data: OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 5000  
-- Order 10 data: OrderID = 10, ClientID = "Cl2", ProductID = "P2", Quantity = 5, Cost = 100   
REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
VALUES (9, "Cl1", "P1", 10, 5000), (10, "Cl2", "P2", 5, 100);
SELECT * FROM Orders;
 
-- Task 2 solution: Lucky Shrub have noticed that the cost of order number 9 is $5000. This is a mistake. The order should cost $500. 
-- You must help them to change it to $500 by writing a relevant REPLACE statement.  
REPLACE INTO Orders SET OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;
SELECT * FROM Orders;
SHOW COLUMNS FROM Orders;
DESCRIBE  Orders;


CREATE TABLE Starters(
StarterName VARCHAR(100) NOT NULL PRIMARY KEY, 
Cost Decimal(3,2), 
StarterType VARCHAR(100) DEFAULT 'Mediterranean');

-- Use the REPLACE statement to insert a new data record with the following details. 
REPLACE INTO Starters(StarterName, Cost, StarterType) VALUES("Cheese Bread", 9.50, "Indian");
SELECT * FROM Starters;

-- Task 2: Use the REPLACE statement to change the cost of the Cheese bread from $9.50 to $9.75.
REPLACE INTO Starters SET StarterName="Cheese Bread", Cost=9.75, StarterType="Indian";
-- or
REPLACE INTO Starters (StarterName, Cost, StarterType) VALUES ("Cheese bread", 9.75, "Indian");


