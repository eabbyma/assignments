--NAME: E MA
--EMAIL: eabbyma@gmail.com
-- Write queries for following scenarios - Joins

use AdventureWorks2017
GO

-- 1. Write a query that lists the country and province names from person. 
-- CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.
SELECT c.Name, s.Name
FROM Person.CountryRegion c JOIN Person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
--     Country                        Province
SELECT c.Name AS Country, s.Name AS Province  
FROM Person.CountryRegion c  JOIN Person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode;

-- 2. Write a query that lists the country and province names from person. 
-- CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada.
-- Join them and produce a result set similar to the following.
SELECT c.Name AS Country, s.Name AS Province
FROM Person.CountryRegion c JOIN Person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name IN ('GERMANY','CANADA')
--     Country                        Province

SELECT c.Name AS Country, s.Name AS Province  
FROM Person.CountryRegion c  JOIN Person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode 
WHERE c.Name NOT IN ('Germany', 'Canada');

--  Using Northwind Database: (Use aliases for all the Joins)
use Northwind
GO

-- 3. List all Products that has been sold at least once in last 25 years.
SELECT o.OrderDate, p.ProductName, od.Quantity
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID JOIN Products p ON p.ProductID=od.ProductID
WHERE o.OrderDate >= dateadd(day, -25*365, getdate()) AND od.Quantity > 0

SELECT DISTINCT p.ProductID, p.ProductName 
FROM Orders o JOIN [Order Details] od ON o.OrderID =  od.OrderID JOIN  Products p ON od.ProductID = p.ProductID 
WHERE DATEDIFF(year, o.OrderDate, GETDATE())< 25;


-- 4. List top 5 locations (Zip Code) where the products sold most in last 25 years.
SELECT TOP 5 o.ShipPostalCode AS ZIP_CODE, MAX(od.Quantity) AS AMOUNT_SOLD
FROM Orders o JOIN [Order Details] od ON o.OrderID=od.OrderID 
WHERE o.OrderDate >= dateadd(day, -25*365, getdate()) AND o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER by AMOUNT_SOLD DESC

SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) as qty 
FROM  Orders o JOIN [Order Details] od ON o.OrderID =  od.OrderID 
WHERE o.ShipPostalCode IS NOT NULL  AND DATEDIFF(year, o.OrderDate, GETDATE())< 25 
GROUP BY ShipPostalCode 
ORDER BY qty DESC;


-- 5. List all city names and number of customers in that city.     
SELECT City, COUNT(CustomerID)
FROM Customers
GROUP BY City

select City, count(customerID) as NumOfCustomer 
from customers 
group by City

-- 6. List city names which have more than 2 customers, and number of customers in that city
SELECT City, COUNT(CustomerID) AS CUSTOMER_NUM
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2

select City, count(customerID) as NumOfCustomer 
from customers 
group by City 
having  count(customerID)>2

-- 7. Display the names of all customers along with the count of products they bought
SELECT c.ContactName CUMSTOMER_NAME, COUNT(od.Quantity) AS PRODCT_NUM
FROM Customers c JOIN Orders o on c.CustomerID=o.CustomerID JOIN [Order Details] od on od.OrderID=o.OrderID
GROUP BY c.ContactName

SELECT c.CustomerID, c.CompanyName, c.ContactName,  SUM(od.Quantity) AS QTY 
FROM  Customers c  LEFT JOIN  Orders o  ON c.CustomerID = o.CustomerID LEFT JOIN  [Order Details] od ON o.OrderID = od.OrderID 
GROUP BY c.CustomerID, c.CompanyName, c.ContactName 
ORDER BY QTY;


-- 8. Display the customer ids who bought more than 100 Products with count of products.
SELECT c.CustomerID CUMSTOMER_NAME, SUM(od.Quantity) AS PRODCT_NUM
FROM Customers c JOIN Orders o on c.CustomerID=o.CustomerID JOIN [Order Details] od on od.OrderID=o.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY PRODCT_NUM

SELECT c.CustomerID, SUM(od.Quantity) AS QTY 
FROM  Customers c  LEFT JOIN  Orders o  ON c.CustomerID = o.CustomerID LEFT JOIN  [Order Details] od ON o.OrderID = od.OrderID 
GROUP BY c.CustomerID 
HAVING SUM(od.Quantity) > 100 
ORDER BY QTY;


-- 9. List all of the possible ways that suppliers can ship their products. Display the results AS below
--     Supplier Company Name                Shipping Company Name
SELECT su.CompanyName, sh.CompanyName
FROM Suppliers su CROSS JOIN Shippers sh 
ORDER BY su.CompanyName

SELECT sup.CompanyName, ship.CompanyName FROM Suppliers sup CROSS JOIN Shippers ship Order By 2, 1

--     ---------------------------------            ----------------------------------

-- 10. Display the products order each day. Show Order date and Product Name.
SELECT o.OrderDate, p.ProductName
FROM Products p JOIN [Order Details] od ON p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
ORDER BY o.OrderDate

SELECT o.OrderDate, p.ProductName FROM  Orders o LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID INNER JOIN Products p ON od.ProductID = p.ProductID GROUP BY o.OrderDate, p.ProductName ORDER BY o.OrderDate;

-- 11. Displays pairs of employees who have the same job title.
SELECT COUNT(e.FirstName) dup, m.Title, m.FirstName + ' ' + m.LastName EmployeeName
FROM Employees e LEFT JOIN Employees m ON  e.Title = m.Title
GROUP BY m.Title, m.FirstName, m.LastName
HAVING COUNT(e.FirstName) > 0

--11. --(1) SELECT Title, LastName + ' ' + FirstName AS Name  FROM Employees ORDER BY Title;
--(2) SELECT e1.Title, e1.LastName + ' ' + e1.FirstName AS Name1, e2.LastName + ' ' + e2.FirstName AS Name2  FROM Employees e1 JOIN  Employees e2 ON e1.Title = e2.Title  WHERE e1.FirstName e2.FirstName OR e1.LastName         e2.LastName ORDER BY Title;


-- 12. Display all the Managers who have more than 2 employees reporting to them.
SELECT m.FirstName + ' ' + m.LastName EmployeeName, COUNT(e.EmployeeID) NumReportsTo
FROM Employees e LEFT JOIN Employees m ON  e.ReportsTo = m.EmployeeID
GROUP BY e.ReportsTo, m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) > 1

SELECT T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo, COUNT(T2.ReportsTo) AS Subordinate   
FROM Employees T1 JOIN Employees T2 ON T1.EmployeeId = T2.ReportsTo 
WHERE T2.ReportsTo IS NOT NULL 
GROUP BY T1.EmployeeId, T1.LastName, T1.FirstName,T2.ReportsTo 
HAVING COUNT(T2.ReportsTo) > 2

-- 13. Display the customers and suppliers by city. The results should have the following columns
-- City
-- Name
-- Contact Name,
-- Type (Customer or Supplier)
SELECT s.City, s.CompanyName Name, s.ContactName, 'Suppliers' Type
FROM Suppliers AS s
UNION
SELECT c.City, c.CompanyName AS Name, c.ContactName, 'Customers' AS Type
FROM Customers AS c
ORDER BY city

SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type 
FROM Customers c UNION 
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type 
FROM Suppliers s;

-- All scenarios are based on Database NORTHWIND.

-- 14. List all cities that have both Employees and Customers.
SELECT DISTINCT c.City
FROM Employees e JOIN Customers c ON e.City = c.City

select distinct city from Customers where city in (select city from Employees)

-- 15. List all cities that have Customers but no Employee.
-- a.  Use sub-query
SELECT City
FROM Customers
WHERE City NOT IN(SELECT City FROM Employees)
-- b.  Do not use sub-query

select distinct city  from Customers  where City not in (select distinct city from employees where city is not null)
select distinct city from Customers   except  select distinct city from Employees

-- 16. List all products and their total order quantities throughout all orders.
SELECT p.ProductName, SUM(Quantity) AS TotalOrderQuantities
FROM Products p LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY p.ProductName

select ProductID,SUM(Quantity) as QunatityOrdered from [order details] group by ProductID

-- 17. List all Customer Cities that have at least two customers.
-- a. Use union
SELECT ShipCity 
FROM Customers c Join Orders o On c.CustomerID=o.CustomerID
UNION 
SELECT ShipCity 
FROM Customers c Join Orders o On c.CustomerID=o.CustomerID

-- b. Use no union
SELECT City, COUNT(CustomerID) AS NumOfCustomer
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 1

--a  select city from Customers except select city from customers group by city having COUNT(*)=1 union  select city from customers group by city having COUNT(*)=0
--b select city from customers group by city having COUNT(*)>=2

-- 18. List all Customer Cities that have ordered at least two different kinds of products.
SELECT c.City, COUNT(DISTINCT od.ProductID) AS ProductNum
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
HAVING COUNT(DISTINCT od.ProductID) >= 2
ORDER BY c.City
 
select distinct city from orders o join [order details] od on o.orderid=od.orderid join customers c on c.customerid=o.CustomerID group by city having COUNT(*)>=2

-- 19. List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
SELECT TOP 5 Quantity, p.ProductName, o.ShipCity
FROM [Order Details] od 
LEFT JOIN Products p ON p.ProductID=od.ProductID
LEFT JOIN Orders o ON o.OrderID=od.OrderID

select top 5 ProductID,AVG(UnitPrice) as AvgPrice,(select top 1 City from Customers c join Orders o on o.CustomerID=c.CustomerID join [Order Details] od2 on od2.OrderID=o.OrderID where od2.ProductID=od1.ProductID group by city order by SUM(Quantity) desc) as City from [Order Details] od1 group by ProductID  order by sum(Quantity) desc

-- 20. List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered
-- from. (tip: join  sub-query)
SELECT TOP 1 o.ShipCity
FROM [Order Details] od 
RIGHT JOIN Orders o ON o.OrderID=od.OrderID

select (select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID group by e.EmployeeID,e.City order by COUNT(*) desc) as MostOrderedCity, (select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeID 
group by e.EmployeeID,e.City 
order by sum(Quantity) desc) as MostQunatitySoldCity
-- 21. How do you remove the duplicates record of a table?
-- To find duplicates records use - GROUP_BY clause or ROW_NUMBER()
-- To remove we can use DELETE
