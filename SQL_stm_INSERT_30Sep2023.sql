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