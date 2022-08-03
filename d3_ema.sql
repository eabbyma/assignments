--NAME: E MA
--EMAIL: eabbyma@gmail.com

-- 1. Create a view named “view_product_order_[your_last_name]”, 
-- list all products and total ordered quantity for that product.
CREATE VIEW view_product_order_Ma
AS
SELECT p.ProductName, od.Quantity
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName

SELECT ProductName, SUM(Quantity) AS productQuantity
FROM view_product_order_Ma
GROUP BY ProductName
ORDER BY ProductName

-- 2. Create a stored procedure “sp_product_order_quantity_[your_last_name]” 
-- that accept product id as an input and total quantities of order as output parameter.
CREATE PROC sp_product_order_quantity_Ma
@productID int,
@totalQuantity int out
AS
BEGIN
SELECT @totalQuantity = SUM(od.Quantity)
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID
WHERE p.ProductID = @productID
GROUP BY p.ProductName
END

BEGIN
DECLARE @total int
EXEC sp_product_order_quantity_Ma 1, @total out
PRINT @total
END

-- 3. Create a stored procedure “sp_product_order_city_[your_last_name]” 
-- that accept product name as an input and top 5 cities that ordered most that product combined with 
-- the total quantity of that product ordered from that city as output.
CREATE PROC sp_product_order_city_Ma
@productName varchar(20),
@city varchar(20) out,
@quantity int out
AS
BEGIN
SELECT @city = o.ShipCity, @quantity = SUM(od.Quantity)
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.ProductName = @productName
GROUP BY o.ShipCity
ORDER BY od.Quantity
END

BEGIN
DECLARE @Cityname varchar(20), @Quantiynum int
EXEC sp_product_order_city_Ma 'Alice Mutton', @Cityname, @Quantiynum
PRINT @Cityname
END

-- 4. Create 2 new tables “people_your_last_name” “city_your_last_name”. 
-- City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. 
-- People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. 
-- Remove city of Seattle. If there was anyone from Seattle, put them into a new city “Madison”. 
-- Create a view “Packers_your_name” lists all people from Green Bay. 
-- If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
DECLARE @city_ma Table (Id int, City varchar(20))
DECLARE @people_ma Table (Id int, Name_ varchar(20), City varchar(20))

INSERT INTO @city_ma
VALUES
(1,'Seattle'),
(2,'Green Bay')

INSERT INTO @people_ma
VALUES
(1,'Aaron Rodgers', 2),
(2,'ussell Wilson', 1),
(3,'Jody Nelson', 2)

CREATE VIEW Packers_Ma
AS
SELECT c.Id, p.Name_, p.City 
FROM city_ma AS c JOIN people_ma AS p on c.Id = p.Id

DROP TABLE city_ma, people_ma, Packers_Ma

-- 5. Create a stored procedure “sp_birthday_employees_[you_last_name]” that 
--creates a new table “birthday_employees_your_last_name” 
--and fill it with all employees that have a birthday on Feb. 
--(Make a screen shot) drop the table. 
--Employee table should not be affected.
CREATE PROC sp_birthday_employees_Ma
AS
BEGIN
    CREATE TABLE birthday_employees_Ma
    @birthday var(20)
    @name var(20) 
END

CREATE DATABASE birthday_employees_Ma_snapshot 
DROP birthday_employees_Ma_snapshot


-- 6.      How do you make sure two tables have the same data?
-- SELECT * FROM Table1
-- UNION
-- SELECT * FROM Table2

