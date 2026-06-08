/* ====================================
   KPI QUERIES
==================================== */

-- Total Revenue

SELECT
SUM(p.Price * od.Quantity) AS TotalRevenue
FROM OrderDetails od
JOIN Products p
ON od.ProductID = p.ProductID;


-- Total Orders

SELECT COUNT(*) AS TotalOrders
FROM Orders;


-- Total Customers

SELECT COUNT(*) AS TotalCustomers
FROM Customers;


/* ====================================
   SALES ANALYSIS
==================================== */

-- Monthly Revenue Trend

SELECT
DATE_FORMAT(o.OrderDate,'%Y-%m') AS Month,
ROUND(SUM(p.Price * od.Quantity),2) Revenue
FROM Orders o
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY Month
ORDER BY Month;


/* ====================================
   PRODUCT ANALYSIS
==================================== */

-- Top 10 Products

SELECT
p.ProductName,
SUM(od.Quantity) QuantitySold
FROM OrderDetails od
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY QuantitySold DESC
LIMIT 10;


-- Revenue by Category

SELECT
p.Category,
ROUND(SUM(p.Price * od.Quantity),2) Revenue
FROM OrderDetails od
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;


/* ====================================
   CUSTOMER ANALYSIS
==================================== */

-- Top 10 Customers

SELECT
c.CustomerName,
ROUND(SUM(p.Price * od.Quantity),2) Spending
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Spending DESC
LIMIT 10;


-- Orders by State

SELECT
c.State,
COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.State
ORDER BY TotalOrders DESC;
