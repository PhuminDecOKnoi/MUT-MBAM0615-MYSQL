-- การใช้งานคำสั่ง SELECT,WHERE,IN,CONCAT,OR
-- SELECT * FROM test.products;
-- SELECT * FROM test.employees;
-- SELECT EmployeeID,TitleOfCourtesy,FirstName,LastName,Title,country
-- FROM test.employees;
SELECT EmployeeID,CONCAT(TitleOfCourtesy," ",FirstName," ",LastName),country FROM test.employees;
SELECT productid, productname, categoryid, unitprice FROM test.products;
SELECT productid, productname, categoryid, unitprice, unitsinstock FROM test.products WHERE unitsinstock=0;
SELECT productid, productname, categoryid, unitprice, unitsinstock FROM test.products WHERE unitsinstock<20;
SELECT productid, productname, categoryid, unitprice, unitsinstock FROM test.products WHERE categoryid=1 or categoryid=8;
SELECT productid, productname, categoryid, unitprice, unitsinstock FROM test.products WHERE categoryid IN (1,5,8);
SELECT * FROM test.customers WHERE `Country`= "USA";
SELECT * FROM test.customers WHERE `Country`= "UK" or `Country`="USA";
SELECT * FROM test.customers WHERE `Country`IN ("UK","USA");