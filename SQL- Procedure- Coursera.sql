USE lucky_shrub;
select * from orders;

-- Task 1: Write a SQL statement that creates a stored procedure called 'GetOrdersData' which retrieves all data from the Orders table.
CREATE PROCEDURE GetOrderData() 
SELECT * FROM Orders;

CALL GetOrderData();
DROP PROCEDURE GetOrderDate;

-- Task 2: Write a SQL statement that creates a stored procedure called “GetListOfOrdersInRange”.
-- The procedure must contain two parameters that determine the range of retrieved data based on the 
-- user input of two cost values “MinimumValue” and “MaximumValue”.
-- Once you have executed the query, call the “GetListOfOrdersInRange” to display the data of orders that cost between $150 and $600. 

CREATE PROCEDURE GetListOfOrdersInRange (MinimumValue DECIMAL, MaximumValue DECIMAL) 
SELECT * FROM Orders WHERE Cost >= MinimumValue AND Cost <= MaximumValue;

CREATE PROCEDURE GetListOfOrdersInRange(MinimumValue INT, MaximumValue INT)
SELECT * FROM Orders 
WHERE Cost BETWEEN MinimumValue AND MaximumValue;


CALL GetListOfOrdersInRange(200.50,800.50);
DROP PROCEDURE GetListOfOrdersInRange;