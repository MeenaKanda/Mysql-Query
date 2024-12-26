USE little_lemon;

-- Task 1 Write a SQL statement that creates the Staff table with the following columns.
-- StaffID: INT
-- FullName: VARCHAR(100)
-- PhoneNumber: VARCHAR(10)

CREATE TABLE Staffs(
StaffID INT,
FullName VARCHAR(100),
PhoneNumber VARCHAR(10));

SHOW COLUMNS FROM Staffs; 

-- Task 2 Write a SQL statement to apply the following constraints to the Staff table:
-- StaffID: INT NOT NULL and PRIMARY KEY
-- FullName: VARCHAR(100) and NOT NULL
-- PhoneNumber: INT NOT NULL

ALTER TABLE Staffs
MODIFY  StaffId INT NOT NULL PRIMARY KEY,
MODIFY FullName VARCHAR(100) NOT NULL,
MODIFY PhoneNumber INT NOT NULL; 

SHOW COLUMNS FROM Staffs;
-- Task 3 Write a SQL statement that adds a new column called 'Role' to the Staff table with the following constraints:
-- Role: VARCHAR(50) and NOT NULL

ALTER TABLE Staffs
ADD COLUMN Role VARCHAR(50) NOT NULL;

SHOW COLUMNS FROM Staffs;

-- Task  -- 4 Write a SQL statement that drops the Phone Number column from the 'Staff' table.

ALTER TABLE Staffs
DROP COLUMN PhoneNumber;

SHOW COLUMNS FROM Staffs;

-- -----------------------------------------    ----------------   -------------------------
    -- create table and copying date from one table to other table  ---

CREATE TABLE Customers(
CustomerID INT NOT NULL PRIMARY KEY,
CustomerName VARCHAR(50),
PhoneNumber INT NOT NULL UNIQUE);

SHOW COLUMNS FROM Customers;

CREATE TABLE FoodOrders (
OrderID INT, 
Quantity INT, 
Order_Status VARCHAR(15), 
Cost Decimal(4,2));

SHOW COLUMNS FROM FoodOrders;

-- Task 1: Use the ALTER TABLE statement with MODIFY command to make the OrderID the primary key of the 'FoodOrders' table. 
ALTER TABLE FoodOrders
MODIFY OrderID INT PRIMARY KEY;

-- Task 2: Apply the NOT NULL constraint to the quantity and cost columns.
ALTER TABLE FoodOrders
MODIFY Quantity INT NOT NULL, 
MODIFY Cost Decimal(4,2) NOT NULL;

-- Task 3: Create two new columns, OrderDate with a DATE datatype and CustomerID with an INT datatype. Declare both must as NOT NULL. 
-- Declare the CustomerID as a foreign key in the FoodOrders table to reference the CustomerID column existing in the Customers table.
ALTER TABLE FoodOrders
ADD COLUMN OrderDate DATE NOT NULL,
ADD COLUMN CustomerID INT NOT NULL,
ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

SHOW COLUMNS FROM FoodOrders;

-- Task 4: Use the DROP command with ALTER statement to delete the OrderDate column from the 'FoodOrder' table. 
ALTER TABLE FoodOrders
DROP COLUMN OrderDate;
SHOW COLUMNS FROM FoodOrders;

-- Task 5: Use the CHANGE command with ALTER statement to rename the column Order_Status in the OrderStatus table to DeliveryStatus. 
ALTER TABLE FoodOrders
CHANGE COLUMN Order_Status  DeliveryStatus VARCHAR(15);
SHOW COLUMNS FROM FoodOrders;

-- Task 6: Use the RENAME command with ALTER statement to change the table name from OrderStatus to OrderDeliveryStatus.

USE little_lemon;
ALTER TABLE FoodOrders 
RENAME TO Customer_FoodOrder;
SHOW COLUMNS FROM Customer_FoodOrder;

-- --------------    ---------------------    --------------------
SHOW COLUMNS from Clients;
INSERT INTO clients(ClientID,FullName,PhoneNumber) 
VALUES (10,"Meena",3456728),
(11, "Sammu", 345674),
(12, "Tanish", 763548),
(13,"Kanda", 635483);


CREATE TABLE ClientTest SELECT * FROM Clients;  -- copy from one table to other table-- but key constraint is not copied only values copied --
SHOW COLUMNS FROM ClientTest;
SELECT * FROM ClientTest;
CREATE TABLE ClientTest1 LIKE Clients; -- this statement copy key constraint from clients table --
SHOW COLUMNS FROM ClientTest1;
INSERT INTO ClientTest1 SELECT * FROM Clients;  -- now data also copied from one table to other table
SELECT * FROM ClientTest1;

CREATE TABLE ClientTest2 SELECT FullName,PhoneNumber FROM Clients WHERE ClientID=12;
SHOW COLUMNS FROM ClientTest2;
SELECT * FROM ClientTest2;

CREATE TABLE ClientTest3 SELECT FullName,PhoneNumber FROM Clients WHERE ClientID=12;

-- copy table from one database table to other database table --
CREATE TABLE meena.ClientTest SELECT * FROM little_lemon.Clients;
use meena;
SHOW COLUMNS FROM ClientTest;
SELECT * FROM ClientTest;