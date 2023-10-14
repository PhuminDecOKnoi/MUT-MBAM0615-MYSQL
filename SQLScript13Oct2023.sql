-- ติวก่อนสอบวันที่ 13/10/2023
SELECT *
FROM test.customers;

SELECT *
FROM test.customers
WHERE CustomerID="ANATR" AND ContactTitle="Owner";

SELECT *
FROM test.customers
WHERE PostalCode IN ("67000","1010");

SELECT orders.OrderID AS เลขที่ใบสั่งซื้อ,
    SUM(Quantity*UnitPrice) AS ยอดขาย,
    COUNT(orders.CustomerID) AS จำนวนลูกค้า
FROM test.orderdetails, test.orders
WHERE orderdetails.`OrderID` = orders.`OrderID`
GROUP BY เลขที่ใบสั่งซื้อ
ORDER BY จำนวนลูกค้า DESC;

SELECT *
FROM test.products;
SELECT *
FROM test.orderdetails;
SELECT *
FROM test.orders;

SELECT products.productName,SUM(orderdetails.Unitprice*orderdetails.Quantity),OrderDate
FROM test.products, test.orderdetails, test.orders
WHERE products.`productID`= orderdetails.`productID`
AND MONTH(orders.OrderDate)=10
GROUP BY productName;

-- โจทย์ หายอดขายของพนักงานขายแต่ละคน (ชื่อรายคน)
-- Step การ Query ข้อมูล
-- 1. Query ข้อมูลแต่ละตาราง ที่เกี่ยวข้องก่อน ตามตัวอย่าง
SELECT *
FROM test.orderdetails;
SELECT *
FROM test.employees;
SELECT *
FROM test.orders;
-- 2 กำหนด ตาราง (tables) หลังคำสั่ง FROM
-- 3 แสดงข้อมูล (Query) ออกมาให้เห็นก่อน บรรทัด SELECT * เชค Error
-- 4 เชื่อมเงื่อนไข P.Key ,F.Key ด้วยคำสั่ง = หลัง WHERE
-- 5 แสดงข้อมูล (Query) ออกมาให้เห็นก่อน บรรทัด SELECT * เชค Error
-- 6 แสดงข้อมูล (Query) ออกมาให้เห็นก่อน บรรทัด SELECT ตาม Colums ที่โจทย์ให้ไว้
-- 7 Grouping ข้อมูลด้วย Group By ต้องใช้ร่วมกับ SUM() , COUNT() , AV() หลัง SELECT
-- 8 Sort ข้อมูล จากน้อยไปหามาก (ACS) ,จากมากไปหาน้อย (DESC)
-- 9 ตกแต่งชุดคำสั่งด้วย AS ชื่อตาราง ให้สวยงาน
-- 10 แสดงข้อมูล (Query) ออกมาให้เห็นก่อน บรรทัด SELECT * เชค Error
-- จากโจทน์ น้องสุ
SELECT CONCAT(`TitleOfCourtesy`,`FirstName`," ",`LastName`) AS รายชื่อพนักงาน,
    FORMAT(SUM(orderdetails.Unitprice*orderdetails.Quantity),0) AS ยอดขาย
FROM test.orderdetails,test.employees,test.orders
WHERE employees.`EmployeeID` = orders.`EmployeeID` AND employees.TitleOfCourtesy <> ""
GROUP BY รายชื่อพนักงาน
ORDER BY ยอดขาย;