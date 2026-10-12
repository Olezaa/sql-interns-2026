--1
SELECT * FROM Customers

SELECT * FROM Orders

SELECT * FROM Suppliers

--2
SELECT ContactName
FROM Customers
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactName ASC

--3
SELECT *
FROM Orders
WHERE OrderDate = '1997-05-19'

--4
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC

--5
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock = 0

--6
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain')

--7
SELECT AVG(UnitPrice) AS AveragePrice,  MIN(UnitPrice) AS MinimumPrice,MAX(UnitPrice) AS MaximumPrice
FROM Products

--8
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL

--9
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '98124%'

--10
SELECT LastName, FirstName, City
FROM Employees
WHERE City NOT IN ('Seattle')

--11
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%'

--12
SELECT CustomerID, SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200

--13
SELECT p.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
FROM Products AS p
INNER JOIN Suppliers AS s
 ON p.SupplierID = s.SupplierID
INNER JOIN Categories AS c
 ON p.CategoryID = c.CategoryID

--14
SELECT o.OrderID, e.FirstName, e.LastName
FROM Orders AS o
INNER JOIN Employees AS e
 ON o.EmployeeID = e.EmployeeID
WHERE o.ShippedDate > o.RequiredDate

--15
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) < 200

--16
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
WHERE OrderDate >= '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(*) > 15

--17
SELECT p.ProductName, p.UnitPrice, s.CompanyName
FROM Products AS p
INNER JOIN Suppliers AS s
    ON p.SupplierID = s.SupplierID

--18
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalCost
FROM Products AS p
INNER JOIN [Order Details] AS od
    ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.UnitPrice * od.Quantity) > 200

--19
SELECT OrderID, COUNT(*) AS NumberofOrders
FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC

--20
SELECT p.SupplierID, p.ProductName, s.CompanyName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY p.SupplierID ASC