USE little_lemon;
show tables;
SELECT * FROM customers;
SHOW COLUMNS FROM customers;
DROP TABLE customers;

CREATE TABLE Customer
(CustomerID INT NOT NULL PRIMARY KEY, 
FullName VARCHAR(100) NOT NULL, 
PhoneNumber INT NOT NULL UNIQUE);

INSERT INTO Customer(CustomerID, FullName, PhoneNumber) VALUES 
(1, "Vanessa McCarthy", 0757536378), 
(2, "Marcos Romero", 0757536379), 
(3, "Hiroki Yamane", 0757536376), 
(4, "Anna Iversen", 0757536375), 
(5, "Diana Pinto", 0757536374);

CREATE TABLE Booking 
(BookingID INT NOT NULL PRIMARY KEY,  
BookingDate DATE NOT NULL,  
TableNumber INT NOT NULL, 
NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8), 
CustomerID INT NOT NULL, FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE); 

INSERT INTO Booking (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES 
(10, '2021-11-11', 7, 5, 1), 
(11, '2021-11-10', 5, 2, 2), 
(12, '2021-11-10', 3, 2, 4);

-- Task 1: Little Lemon want a list of all customers who have made bookings. 
-- Write an INNER JOIN SQL statement to combine the full name and the phone number of each customer from 
-- the Customers table with the related booking date and 'number of guests' from the Bookings table. 

SELECT * FROM customer;
SELECT * FROM booking;

SELECT customer.FullName, customer.PhoneNumber, booking.BookingDate, booking.NumberOfGuests 
FROM customer INNER JOIN booking 
ON customer.CustomerID = booking.CustomerId;

-- Task 2: Little Lemon want to view information about all existing customers with bookings that have been made so far. 
-- This data must include customers who haven’t made any booking yet. 

SELECT customer.CustomerID, booking.BookingID  
FROM customer LEFT JOIN booking 
ON customer.CustomerID = booking.CustomerID;
