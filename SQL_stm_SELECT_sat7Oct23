-----------
-- 07-10-2023
-----------
-- โจทย์ทบทวน 1
SELECT orderID, productName, orderdetails.UnitPrice, Quantity,orderdetails.UnitPrice*Quantity
FROM test.orderdetails ,test.products
WHERE orderdetails.productID = products.productID AND orderID='10253';
-- การเลือกแบบมีระบุเงื่อนไข
-- ID 10253
-- order id,productname,Unitprice,Quantity,UnitPrice*Quantity

-- โจทย์ทบทวน 2
SELECT employees.`EmployeeID`,
        CONCAT(test.employees.`FirstName`," ",test.employees.`LastName`),
        FORMAT(SUM(`UnitPrice`*`Quantity`),2)
FROM test.orderdetails,test.orders,test.employees
WHERE test.orderdetails.`orderID` = test.orders.`orderID`
    AND orders.`EmployeeID` = employees.`EmployeeID`
GROUP BY test.employees.`EmployeeID`;

-- โจทย์ทบทวน 3
SELECT * FROM test.orders;
SELECT * FROM test.shippers;
SELECT ShipVia,
    COUNT(*),
    test.shippers.`CompanyName`
FROM test.orders ,test.shippers
WHERE orders.`ShipVia` = shippers.`ShipperID`
GROUP BY ShipVia;

-- โจทย์ทบทวน 4
SELECT *
FROM test.customers;

SELECT orders.`OrderID`,
    customers.`CustomerID`,
    customers.`CompanyName`,
    SUM(orderdetails.`UnitPrice`*orderdetails.`Quantity`) AS ยอดซื้อ
FROM test.orders, test.orderdetails ,test.customers
WHERE orders.`orderID` = orderdetails.`OrderID`
    AND orders.`CustomerID` = customers.`CustomerID`
GROUP BY orders.`OrderID`
-- ORDER BY orders.`OrderID` DESC;
-- ORDER BY customers.`CustomerID`ASC;
ORDER BY ยอดซื้อ DESC;