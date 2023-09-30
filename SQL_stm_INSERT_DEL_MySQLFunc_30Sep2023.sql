-- INSERT INTO ...information_schema
INSERT INTO test.products(productID, productName,categoryID,UnitPrice,UnitsInStock,Discontinued)
VALUES (78, "HP Computer",8 ,20000,100,false);
-- UPDATE ..information_Schema
UPDATE test.products SET `UnitPrice`=30000
WHERE `ProductID`=78;
---
UPDATE test.products SET `QuantityPerUnit`="1 box"
WHERE `ProductID`=78;
-- DELETE ..information_Schema
DELETE  FROM test.products
WHERE `ProductID`=78;

-- SELECT LIKE
SELECT * FROM test.customers WHERE `CompanyName` LIKE "b%";
SELECT * FROM test.customers WHERE `CompanyName` LIKE "a%";
SELECT * FROM test.customers WHERE `CompanyName` LIKE "%a";
SELECT * FROM test.customers WHERE `ContactTitle` LIKE "sales%";
-- MySQL/SQL DATE FUNCTIONS
-- หาดูข้อมูลเพิ่มเติมได้ที่ https://www.w3schools.com/mysql/mysql_ref_functions.asp#gsc.tab=0
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT DAY(CURDATE());
SELECT MONTHNAME("2023-10-15");
SELECT YEAR(CURDATE());
SELECT YEAR(`orderDate`) FROM orders;
SELECT DISTINCT YEAR(`orderDate`) FROM orders;
SELECT * FROM test.orders 
WHERE MONTH(`OrderDate`)=10 AND YEAR(`OrderDate`)=1996;
SELECT *, DATEDIFF(`OrderDate`,`ShippedDate`) FROM test.orders 
WHERE MONTH(OrderDate)=10 AND YEAR(OrderDate)=1996;
SELECT *, DATEDIFF(`OrderDate`,`ShippedDate`) AS _DIFF_DATE FROM test.orders 
WHERE MONTH(OrderDate)=10 AND YEAR(OrderDate)=1996;
SELECT DATE_ADD(CURDATE(),INTERVAL 10 DAY) AS _DATE_ADDED_DAY;
SELECT DATE_ADD(CURDATE(),INTERVAL 10 MONTH) AS _DATE_ADDED_MONTH;
SELECT `CategoryID`,COUNT(*) AS _QNTY_PRODUCTS FROM test.products
GROUP BY `CategoryID` HAVING COUNT(*)>10; -- GROUP BY ออกข้อสอบปลายภาค
SELECT `CategoryName`,COUNT(*) AS _QNTY_PRODUCTS FROM test.products, test.categories
WHERE test.products.`CategoryID` = test.categories.`CategoryID`
GROUP BY test.products.`CategoryID`; -- GROUP BY ออกข้อสอบปลายภาค
SELECT SUM(`UnitPrice`*`UnitsInStock`) AS ALL_SUM_PRICE FROM test.products;
SELECT `CategoryID`,SUM(`UnitPrice`*`UnitsInStock`) FROM test.products;
SELECT `CategoryName`,`UnitPrice`*COUNT(*) AS _SUM_OF_PRICE FROM test.products, test.categories
WHERE test.products.`CategoryID` = test.categories.`CategoryID`
GROUP BY test.products.`CategoryID`;  -- GROUP BY ออกข้อสอบปลายภาค
SELECT `CategoryName`,SUM(`UnitPrice`*`UnitsInStock`) AS _SUM_OF_PRICE FROM test.products, test.categories
WHERE test.products.`CategoryID` = test.categories.`CategoryID`
GROUP BY test.products.`CategoryID`;  -- GROUP BY ออกข้อสอบปลายภาค
--- แบบฝึกหัด
SELECT SUM(`UnitPrice`*`Quantity`) AS GOD_SALE FROM test.orderdetails;
SELECT `ProductName` AS สินค้า,(test.orderdetails.`UnitPrice`*`Quantity`) AS ราคาขายแยกสินค้า
FROM test.orderdetails,test.products 
WHERE test.orderdetails.`ProductID` = test.products.`ProductID`
GROUP BY test.orderdetails.`ProductID`;

SELECT `ProductName` AS สินค้า,(test.orderdetails.`UnitPrice`*`Quantity`) AS ราคาขายแยกสินค้า, `OrderDate` AS วันที่สั่งซื้อสินค้า
FROM test.orderdetails,test.products, test.orders
WHERE test.orderdetails.`ProductID` = test.products.`ProductID`
AND MONTH(orderdate)=10 AND YEAR(orderdate)=1996
GROUP BY test.orderdetails.`ProductID`;
-- แบบฝึกหัด
SELECT Orders.EmployeeID AS รหัสพนักงาน ,
Employees.FirstName AS ชื่อ,
Employees.LastName AS นามสกุล ,
Employees.Title AS ตำแหน่งงาน,
SUM(Orderdetails.UnitPrice*Orderdetails.Quantity) AS ยอดขาย,
COUNT(Orders.CustomerID) AS จำนวนลูกค้า
FROM test.orders,test.employees,test.orderdetails
WHERE test.orders.employeeID = test.employees.employeeID
GROUP BY test.orders.employeeID;