USE little_lemon;
CREATE TABLE MenuItems ( 
  ItemID INT, 
  Name VARCHAR(200), 
  Type VARCHAR(100), 
  Price INT, 
  PRIMARY KEY (ItemID) 
); 

CREATE TABLE Menus ( 
  MenuID INT, 
  ItemID INT, 
  Cuisine VARCHAR(100), 
  PRIMARY KEY (MenuID,ItemID)
); 

CREATE TABLE Bookings ( 
  BookingID INT, 
  TableNo INT, 
  GuestFirstName VARCHAR(100), 
  GuestLastName VARCHAR(100), 
  BookingSlot TIME, 
  EmployeeID INT, 
  PRIMARY KEY (BookingID) 
);  

CREATE TABLE TableOrders ( 
  OrderID INT, 
  TableNo INT, 
  MenuID INT, 
  BookingID INT, 
  BillAmount INT, 
  Quantity INT, 
  PRIMARY KEY (OrderID,TableNo) 
);  

INSERT INTO MenuItems VALUES(1,'Olives','Starters', 5), 
(2,'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8), 
(4, 'Tomato bread','Starters', 8), 
(5, 'Falafel', 'Starters', 7), 
(6, 'Hummus', 'Starters', 5), 
(7, 'Greek salad', 'Main Courses', 15), 
(8, 'Bean soup', 'Main Courses', 12), 
(9, 'Pizza', 'Main Courses', 15), 
(10,'Greek yoghurt','Desserts', 7), 
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4), 
(13, 'Athens White wine', 'Drinks', 25), 
(14, 'Corfu Red Wine', 'Drinks', 30), 
(15, 'Turkish Coffee', 'Drinks', 10), 
(16, 'Turkish Coffee', 'Drinks', 10), 
(17, 'Kabasa', 'Main Courses', 17);

DESCRIBE MenuItems;
SELECT * FROM MenuItems;

INSERT INTO Menus VALUES(1, 1, 'Greek'), 
(1, 7, 'Greek'), 
(1, 10, 'Greek'), 
(1, 13, 'Greek'), 
(2, 3, 'Italian'), 
(2, 9, 'Italian'), 
(2, 12, 'Italian'), 
(2, 15, 'Italian'), 
(3, 5, 'Turkish'), 
(3, 17, 'Turkish'), 
(3, 11, 'Turkish'), 
(3, 16, 'Turkish');
DESCRIBE Menus;
SELECT * FROM Menus;

DESCRIBE Menus;
SELECT * FROM Menus;

INSERT INTO Bookings VALUES
(1,12,'Anna','Iversen','19:00:00',1),  
(2, 12, 'Joakim', 'Iversen', '19:00:00', 1), 
(3, 19, 'Vanessa', 'McCarthy', '15:00:00', 3), 
(4, 15, 'Marcos', 'Romero', '17:30:00', 4), 
(5, 5, 'Hiroki', 'Yamane', '18:30:00', 2),
(6, 8, 'Diana', 'Pinto', '20:00:00', 5); 
DESCRIBE Bookings;
SELECT * FROM Bookings;

INSERT INTO TableOrders VALUES
(1, 12, 1, 1, 2, 86), 
(2, 19, 2, 2, 1, 37), 
(3, 15, 2, 3, 1, 37), 
(4, 5, 3, 4, 1, 40), 
(5, 8, 1, 5, 1, 43);
SELECT * FROM TableOrders;

-- Task 1: Write a SQL SELECT query to find all bookings that are due after the booking of the guest ‘Vanessa McCarthy’.
SELECT * FROM Bookings WHERE BookingSlot >
(SELECT BookingSlot FROM Bookings WHERE GuestFirstName="Vanessa" AND GuestLastName="McCarthy");

-- Task 2: Write a SQL SELECT query to find the menu items that are more expensive than all the 'Starters' and 'Desserts' menu item types.
SELECT * FROM MenuItems WHERE Price > ALL(SELECT Price FROM MenuItems WHERE Type IN("Starters","Desserts"));

-- Task 3: Write a SQL SELECT query to find the menu items that costs the same as the starter menu items that are Italian cuisine.
SELECT * FROM MenuItems WHERE Price = 
(SELECT Price FROM Menus, MenuItems WHERE Menus.ItemID = MenuItems.ItemID AND MenuItems.Type = 'Starters' AND Cuisine = 'Italian'); 

 -- --    -----
SELECT ItemID FROM Menus WHERE Cuisine="Italian";
SELECT * FROM MenuItems WHERE ItemID IN(SELECT ItemID FROM Menus WHERE Cuisine="Italian") AND Type="Starters";
SELECT Price FROM MenuItems WHERE ItemID IN(SELECT ItemID FROM Menus WHERE Cuisine="Italian") AND Type="Starters";
SELECT * FROM MenuItems WHERE Price = (SELECT Price FROM MenuItems WHERE ItemID IN(SELECT ItemID FROM Menus WHERE Cuisine="Italian") AND Type="Starters");
-- ----- -------

-- Task 4: Write a SQL SELECT query to find the menu items that were not ordered by the guests who placed bookings.
SELECT * FROM MenuItems 
WHERE NOT EXISTS (SELECT * FROM TableOrders, Menus WHERE TableOrders.MenuID = Menus.MenuID AND Menus.ItemID = MenuItems.ItemID); 


-- ----------------- ******************* ******************** --------------------------------------

CREATE TABLE Res_MenuItems (
  ItemID int NOT NULL,
  Name varchar(200) DEFAULT NULL,
  Type varchar(100) DEFAULT NULL,
  Price int DEFAULT NULL,
  PRIMARY KEY (ItemID)
);

INSERT INTO Res_MenuItems VALUES
(1,'Olives','Starters',5),
(2,'Flatbread','Starters',5),
(3,'Minestrone','Starters',8),
(4,'Tomato bread','Starters',8),
(5,'Falafel','Starters',7),
(6,'Hummus','Starters',5),
(7,'Greek salad','Main Courses',15),
(8,'Bean soup','Main Courses',12),
(9,'Pizza','Main Courses',15),
(10,'Greek yoghurt','Desserts',7),
(11,'Ice cream','Desserts',6),
(12,'Cheesecake','Desserts',4),
(13,'Athens White wine','Drinks',25),
(14,'Corfu Red Wine','Drinks',30),
(15,'Turkish Coffee','Drinks',10),
(16,'Turkish Coffee','Drinks',10),
(17,'Kabasa','Main Courses',17);

DESCRIBE Res_MenuItems;
SELECT * FROM Res_MenuItems;

CREATE TABLE LowCostMenuItems
(ItemID INT, Name VARCHAR(200), Price INT, PRIMARY KEY(ItemID));

DESCRIBE LowCostMenuItems;

-- Task 1: Find the minimum and the maximum average prices at which the customers can purchase food and drinks.
SELECT Type, avg(Price) AS Average from Res_MenuItems GROUP BY Type;

SELECT ROUND(MIN(Average),2) , ROUND(MAX(Average),2) 
FROM(SELECT Type, avg(Price) AS Average FROM Res_MenuItems GROUP BY Type) AS avgPrice;


-- Task 2 solution: Insert data of menu items with a minimum price based on the 'Type' into the LowCostMenuItems table. 
INSERT INTO LowCostMenuItems 
SELECT ItemID, Name, Price FROM Res_MenuItems
WHERE Price = ANY(SELECT min(Price) FROM Res_MenuItems GROUP BY Type); 
SELECT * FROM LowCostMenuItems;

SELECT * FROM RES_MENUITEMS;

-- Task 3 solution: Delete all the low-cost menu items whose price is 
-- more than the minimum price of menu items that have a price between $5 and $10. 

DELETE FROM LowCostMenuItems Where Price > 
ANY(SELECT min(Price) as p from Res_MenuItems group by Type HAVING P BETWEEN 5 AND 10);

SELECT * FROM LowCostMenuItems;
