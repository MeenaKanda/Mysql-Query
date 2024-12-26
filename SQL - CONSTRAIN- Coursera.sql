USE little_lemon;

-- Task 1: Create the Clients table with the following columns and constraints.
-- ClientID: INT, NOT NULL and PRIMARY KEY
-- FullName: VARCHAR(100) NOT NULL
-- PhoneNumber: INT, NOT NULL and UNIQUE

CREATE TABLE Clients(
ClientID INT NOT NULL PRIMARY KEY,
FullName VARCHAR(100) NOT NULL,
PhoneNumber INT NOT NULL UNIQUE);

SHOW COLUMNS FROM Clients;

-- Task 2: Create the Items table with the following attributes and constraints:
-- ItemID: INT, NOT NULL and PRIMARY KEY
-- ItemName: VARCHAR(100) and NOT NULL
-- Price: Decimal(5,2) and NOT NULL

CREATE TABLE Items(
ItemID INT NOT NULL PRIMARY KEY,
ItemName VARCHAR(100) NOT NULL,
Price Decimal(5,2) NOT NULL);
 
SHOW COLUMNS FROM Items;

-- Task 3: Create the Orders table with the following constraints.
-- OrderID: INT, NOT NULL and PRIMARY KEY
-- ClientID: INT, NOT NULL and FOREIGN KEY
-- ItemID: INT, NOT NULL and FOREIGN KEY
-- Quantity: INT, NOT NULL and maximum allowed items in each order 3 only
-- COST Decimal(6,2) and NOT NULL
CREATE TABLE Orders_c(
OrderID INT NOT NULL PRIMARY KEY,
ClientID INT NOT NULL,
ItemID INT NOT NULL,
Quantity INT NOT NULL CHECK(Quantity <= 3),
Cost Decimal(6,2) NOT NULL,
FOREIGN KEY(ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY(ItemID) REFERENCES Items(ItemID));

SHOW COLUMNS FROM Orders_c;

-- -------------------------   ----------------------------   ------------------------

-- Task 1:  Create the Staff table with the following PRIMARY KEY and NOT NULL constraints:
-- Staff ID should be INT, NOT NULL and PRIMARY KEY
-- PhoneNumber should be INT, NOT NULL and UNIQUE 
-- FullName: VARCHAR(100) NOT NULL.

CREATE TABLE Staff(
StaffID INT NOT NULL PRIMARY KEY,
PhoneNumber INT NOT NULL UNIQUE,
FullName VARCHAR(100) NOT NULL);

SHOW COLUMNS FROM Staff; 

-- Task 2: Create the 'ContractInfo' table with the following key and domain constraints:
-- Contract ID should be INT, NOT NULL and PRIMARY KEY
-- StaffID should be INT, NOT NULL. 
-- Salary should be DECIMAL (7,2), NOT NULL.
-- Location should be VARCHAR (50) NOT NULL with DEFAULT = "Texas". 
-- StaffType should be VARCHAR (20) NOT NULL and should accept a "Junior" or a "Senior" value.

CREATE TABLE ContractInfo(
ContractID INT NOT NULL PRIMARY KEY,
StaffID INT NOT NULL,
Salary DECIMAL(7,2) NOT NULL,
Location VARCHAR(50) NOT NULL DEFAULT "Texas",
StaffType VARCHAR(20) NOT NULL  CHECK(StaffType = "Juniou" OR "Senior"));

SHOW COLUMNS FROM ContractInfo;
-- Task 3: Create a foreign key that links the Staff table with the ContractInfo table. In this example, you need to apply the referential integrity rule as follows:
-- Link each member of staff in the Staff table to a specific contract in the Contract Info table. 
-- Each staff ID existing in the 'Contract Info' table is expected to exist as well in the Staff table. 
-- The staff ID in the 'Contract Info' table should be defined as a foreign key to reference the Staff ID in the Staff table.

ALTER TABLE ContractInfo 
ADD CONSTRAINT FK_StaffID_ContractInfo
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);

SHOW COLUMNS FROM ContractInfo;