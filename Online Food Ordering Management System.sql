CREATE DATABASE OFOMS_db;

USE OFOMS_db;

-- Create a table: Admin_Details
CREATE TABLE Admin_Details (
Admin_ID VARCHAR(5) PRIMARY KEY, Admin_Name VARCHAR(15)
);

-- Insert some values
INSERT INTO Admin_Details VALUES ("AD1", "Team-M1");

-- Fetch some values
SELECT * FROM Admin_Details;

-- Create a table: Customers
CREATE TABLE Customers (
Customer_ID VARCHAR(10) PRIMARY KEY, Customer_Name VARCHAR(20), Customer_Gender VARCHAR(15), Customer_PhoneNo BIGINT,
Customer_Address VARCHAR(100), Admin_ID VARCHAR(5)
);

ALTER TABLE Customers ADD CONSTRAINT FK_Customers_Admin FOREIGN KEY (Admin_ID) REFERENCES Admin_Details (Admin_ID);

-- Insert some values
INSERT INTO Customers VALUES ("CT1", "Mohan", "Male", 9741089115, "44, G R Building, Chetpet, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT2", "Gokul", "Male", 9741988126, "7, Ayyamudali Street, Chintadripet, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT3", "Meera", "Female", 7894562581, "8, Galaxy Apartments, Egmore, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT4", "Devi", "Female", 8478596325, "21, B R Road, Medavakkam, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT5", "David", "Male", 8794152637, "43, T H Road, Mylapore, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT6", "Pradeep", "Male", 9654789432, "52, C K Building, Anna Salai, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT7", "Rakesh", "Male", 9874561471, "21, A R Apartments, Mylapore, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT8", "Revathi", "Female", 8796241536, "23, Main Big Street, Triplicane, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT9", "Sumathi", "Female", 7895216547, "58, V R Street, Triplicane, Chennai", "AD1");
INSERT INTO Customers VALUES ("CT10", "Chandru", "Male", 9657457324, "22, Express Apartments, Egmore, Chennai", "AD1");

-- Fetch some values
SELECT * FROM Customers;

-- Create a table: Restaurant
CREATE TABLE Restaurant (
Restaurant_ID VARCHAR(10) PRIMARY KEY, Restaurant_Name VARCHAR(50), Cuisine_ID VARCHAR(10), Admin_ID VARCHAR(5)
);

-- Insert some values
INSERT INTO Restaurant VALUES ("R1", "Zam Zam Restaurant", "CS1", "AD1");
INSERT INTO Restaurant VALUES ("R2", "CS Restaurant", "CS2", "AD1");
INSERT INTO Restaurant VALUES ("R3", "Excel Restaurant", "CS3", "AD1");
INSERT INTO Restaurant VALUES ("R4", "Anand Restaurant", "CS4", "AD1");

ALTER TABLE Restaurant ADD CONSTRAINT FK_Restaurant_Admin FOREIGN KEY (Admin_ID) REFERENCES Admin_Details (Admin_ID);
ALTER TABLE Restaurant ADD CONSTRAINT FK_Restaurant_Cuisine FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine (Cuisine_ID);


-- Fetch some values
SELECT * FROM Restaurant;

-- Create a table: Cuisine
CREATE TABLE Cuisine (
Cuisine_ID VARCHAR(10) PRIMARY KEY, Cuisine_Name VARCHAR(20)
);

-- Insert some values
INSERT INTO Cuisine VALUES ("CS1", "Arabian");
INSERT INTO Cuisine VALUES ("CS2", "Chinese");
INSERT INTO Cuisine VALUES ("CS3", "Italian");
INSERT INTO Cuisine VALUES ("CS4", "Indian");

-- Fetch some values
SELECT * FROM Cuisine;

-- Create a table: Menu_Items
CREATE TABLE Menu_Items (
Item_Code VARCHAR(10) PRIMARY KEY, Item_Name VARCHAR(30), Price INT, Cuisine_ID VARCHAR(10)
);

ALTER TABLE Menu_Items ADD CONSTRAINT FK_Menu_Items_Cuisine FOREIGN KEY (Cuisine_ID) REFERENCES Cuisine (Cuisine_ID);

-- Insert some values
INSERT INTO Menu_Items VALUES ("IC1", "Chicken Shawarma", 150, "CS1");
INSERT INTO Menu_Items VALUES ("IC2", "Dry Manchurian", 200, "CS2");
INSERT INTO Menu_Items VALUES ("IC3", "Chilli Chicken", 150, "CS2");
INSERT INTO Menu_Items VALUES ("IC4", "Fried Rice", 210, "CS2");
INSERT INTO Menu_Items VALUES ("IC5", "White Sauce Pasta", 140, "CS3");
INSERT INTO Menu_Items VALUES ("IC6", "Cheese Pizza", 250, "CS3");
INSERT INTO Menu_Items VALUES ("IC7", "Aloo Cheese Paratha", 120, "CS4");
INSERT INTO Menu_Items VALUES ("IC8", "Dosa", 100, "CS4");
INSERT INTO Menu_Items VALUES ("IC9", "Masala Dosa", 130, "CS4");
INSERT INTO Menu_Items VALUES ("IC10", "Idly Sambar", 70, "CS4");

-- Fetch some values
SELECT * FROM Menu_Items;

-- Create a table: Order_Details
CREATE TABLE Order_Details (
Order_ID VARCHAR(10) PRIMARY KEY, Order_Date DATETIME, Item_Code VARCHAR(10), Quantity_of_Items INT, Payment_Mode VARCHAR(30),
Delivery_Time_Taken_mins INT, Customer_Rating INT, Customer_ID VARCHAR(10), Restaurant_ID VARCHAR(10)
);

ALTER TABLE Order_Details ADD CONSTRAINT FK_Order_Details_Customers FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID);
ALTER TABLE Order_Details ADD CONSTRAINT FK_Order_Details_Menu_Items FOREIGN KEY (Item_Code) REFERENCES Menu_Items (Item_Code);
ALTER TABLE Order_Details ADD CONSTRAINT FK_Order_Details_Restaurant FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant (Restaurant_ID);

-- Insert some values
INSERT INTO Order_Details VALUES ("OD1", "2024-12-01 03:30:00", "IC1", 2, "Online", 47, 4, "CT1", "R1");
INSERT INTO Order_Details VALUES ("OD2", "2024-12-01 07:30:00", "IC2", 1, "Cash on Delivery", 41, 3, "CT2", "R2"),
("OD3", "2024-12-03 12:30:00", "IC6", 3, "Online", 30, 5, "CT4", "R3"),
("OD4", "2024-12-03 02:30:00", "IC4", 3, "Online", 30, 5, "CT3", "R2"),
("OD5", "2024-12-03 03:30:00", "IC5", 2, "Cash on Delivery", 18, 2, "CT5", "R3"),
("OD6", "2024-12-04 12:30:00", "IC3", 1, "Online", 21, 3, "CT6", "R2"),
("OD7", "2024-12-04 02:30:00", "IC7", 4, "Online", 41, 1, "CT8", "R4"),
("OD8", "2024-12-04 06:30:00", "IC9", 2, "Cash on Delivery", 35, 3, "CT7", "R4"),
("OD9", "2024-12-04 07:30:00", "IC8", 1, "Cash on Delivery", 27, 4, "CT9", "R4"),
("OD10", "2024-12-05 12:30:00", "IC10", 2, "Online", 49, 5, "CT10", "R4"),
("OD11", "2024-12-05 03:30:00", "IC3", 3, "Online", 35, 3, "CT1", "R2"),
("OD12", "2024-12-07 12:30:00", "IC6", 2, "Online", 21, 3, "CT1", "R3"),
("OD13", "2024-12-07 03:30:00", "IC1", 2, "Cash on Delivery", 44, 4, "CT3", "R1"),
("OD14", "2024-12-07 07:30:00", "IC9", 1, "Online", 11, 3, "CT6", "R4"),
("OD15", "2024-12-08 12:30:00", "IC8", 3, "Online", 44, 4, "CT4", "R4"),
("OD16", "2024-12-08 03:30:00", "IC10", 1, "Cash on Delivery", 28, 4, "CT2", "R4"),
("OD17", "2024-12-08 07:30:00", "IC7", 2, "Online", 27, 5, "CT7", "R4"),
("OD18", "2024-12-10 12:30:00", "IC9", 2, "Online", 39, 2, "CT9", "R4"),
("OD19", "2024-12-10 03:30:00", "IC8", 1, "Online", 24, 4, "CT10", "R4"),
("OD20", "2024-12-10 07:30:00", "IC10", 2, "Online", 34, 3, "CT5", "R4");

-- Fetch some values
SELECT * FROM Order_Details;

-- Count of Male and Female Customers
CREATE VIEW `Gender_Count` AS
SELECT Customer_Gender, COUNT(*) AS Gender_Count 
FROM Customers
GROUP BY Customer_Gender;

SELECT * FROM `Gender_Count`;

--  Count of Orders
CREATE VIEW `Order_Count` AS
SELECT COUNT(Order_ID) AS Order_Count 
FROM Order_Details;

SELECT * FROM `Order_Count`;

-- Count of Customers using Online and Cash on Delivery Payment Mode
CREATE VIEW `Payment_Mode_Count` AS
SELECT Payment_Mode, COUNT(*) AS Payment_Mode_Count 
FROM Order_Details
GROUP BY Payment_Mode;

SELECT * FROM `Payment_Mode_Count`;

-- Calculate Average Delivery Time Taken mins
CREATE VIEW `Average_Delivery_Time` AS
SELECT AVG(Delivery_Time_Taken_mins) AS Average_Delivery_Time
FROM Order_Details;

SELECT * FROM `Average_Delivery_Time`;

-- Calculate Average Customer Rating
CREATE VIEW `Average_Customer_Rating` AS
SELECT AVG(Customer_Rating) AS Average_Customer_Rating
FROM Order_Details;

SELECT * FROM `Average_Customer_Rating`;

-- Ranking Food Items based on its price from highest to lowest
CREATE VIEW `Ranking_Food_Price` AS
SELECT Item_Name, Price, DENSE_RANK() OVER (ORDER BY Price DESC) AS Ranking_Food_Price
FROM Menu_Items;

SELECT * FROM `Ranking_Food_Price`;

-- List Food Items and its cuisine
DELIMITER $$

CREATE PROCEDURE Food_Items_Cuisine()
BEGIN 
	SELECT Item_Name, Cuisine_Name 
    FROM Cuisine
	INNER JOIN Menu_Items ON
	Cuisine.Cuisine_ID = Menu_Items.Cuisine_ID;
END $$

DELIMITER ;

-- Average Customer Rating - Gender-wise
DELIMITER $$

CREATE PROCEDURE Avg_Customer_Rating_Gender()
BEGIN 
	SELECT Customer_Gender, AVG(Customer_Rating) AS Average_Customer_Rating 
    FROM Customers
	INNER JOIN Order_Details
	ON Customers.Customer_ID = Order_Details.Customer_ID
	GROUP BY Customer_Gender;
END $$

DELIMITER ;

-- Customer Info
DELIMITER $$

CREATE PROCEDURE Customer_Info(IN a VARCHAR(10))
BEGIN
	SELECT * FROM Customers WHERE Customer_ID = a;
END $$

DELIMITER ;

-- Order Info
DELIMITER $$

CREATE PROCEDURE Order_Info(IN b VARCHAR(10))
BEGIN
	SELECT Order_ID, Order_Date, Customers.Customer_ID, Customer_Name, Item_Name, Quantity_of_Items, 
    Price * Quantity_of_Items AS Total_Order_Amount
	FROM Customers 
	INNER JOIN Order_Details
	ON Customers.Customer_ID = Order_Details.Customer_ID
	INNER JOIN Menu_Items
	ON Order_Details.Item_Code = Menu_Items.Item_Code
	WHERE Order_ID = b;
    
END $$

DELIMITER ;
    
-- Call by Procedures
CALL Food_Items_Cuisine()
CALL Avg_Customer_Rating_Gender()
CALL Customer_Info("CT1")
CALL Order_Info("OD4")