SELECT * FROM test.customers;
SELECT * FROM test.orders;
SELECT * FROM test.employees;
SELECT * FROM test.orderdetails;
SELECT * FROM test.products;
SELECT * FROM test.categories;

-- ข้อ 6
SELECT Orders.orderID AS orderid,
customers.CompanyName AS companyname,
CONCAT(Employees.FirstName," ",LastName) AS Saleman,
SUM(UnitPrice*Quantity) AS Total,
orders.ShipCountry AS shipcountry,
orders.OrderDate AS orderdate
FROM test.orders, test.customers, test.employees, test.orderdetails
WHERE Orders.orderID = Orderdetails.orderID
AND customers.CompanyName = "Old World Delicatessen"
GROUP BY OrderID
ORDER BY total DESC;

-- ข้อ 7
SELECT CategoryName AS categoryname,
COUNT(*)
FROM test.categories, test.products
WHERE categories.CategoryID = products.CategoryID
GROUP BY CategoryName;

-- ข้อ 8
SELECT CONCAT(employees.FirstName," ",employees.LastName) AS Saleman ,
SUM(orderdetails.UnitPrice*orderdetails.UnitPrice) AS total
FROM test.employees, test.orderdetails, test.orders
WHERE orders.OrderID = orderdetails.OrderID
AND orders.EmployeeID = employees.EmployeeID
AND MONTH(orders.OrderDate) = 08 AND YEAR(orders.OrderDate)=1996
GROUP BY Saleman, Orders.EmployeeID;

SELECT
    CONCAT(e.FirstName, ' ', e.LastName) AS Salesman,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Total
FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN orderdetails od ON o.OrderID = od.OrderID
WHERE MONTH(o.OrderDate) = 8 AND YEAR(o.OrderDate) = 1996
GROUP BY e.EmployeeID, Salesman
ORDER BY Salesman ASC;