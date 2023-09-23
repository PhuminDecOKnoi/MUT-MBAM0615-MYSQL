-- INNER JOIN
-- SELECT `ProductName`,`Quantity`,`Discount` 
-- FROM test.products 
-- INNER JOIN test.orderdetails 
-- ON products.ProductID=orderdetails.ProductID
-- WHERE test.orderdetails.Discount=0;
-- --COUNT INNER JOIN
SELECT COUNT(`Quantity`) AS Qnty
FROM test.products 
INNER JOIN test.orderdetails 
ON products.ProductID=orderdetails.ProductID
WHERE test.orderdetails.Discount=0;
--
-- SELECT * FROM test.products WHERE ProductName IN (`Konbu`,`Gravad lax`);