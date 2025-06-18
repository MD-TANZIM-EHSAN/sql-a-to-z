-- ------------------------------------------STRING FUNCTION---------------------------------------------------------
-- -------------------------------------------CALCULATION-----------------------------------------------------------
-- LEN ==> Counts how many characters 
-- Calculate the length of ach customer's name 
SELECT 
    FirstName, LENGTH(FirstName) AS LEN_NAME
FROM
    customers;
-- -------------------------------------------EXTRACTION-----------------------------------------------------------
-- 1==> LEFT :Extract specific num of character from start (VALUE,NUMBER OF CHARACTER)
-- 2==> RIGHT:Extract specific num of character from end (VALUE,NUMBER OF CHARACTER)
--  ?? Retrive the first two characters of each first name ?? 
select 
FirstName,
LEFT(FirstName,2)
FROM customers;
--  ?? Retrive the last two characters of each first name ?? 
select 
FirstName,
RIGHT(FirstName,2)
FROM customers;

-- 3==> ------------SUBSTRING ==> (VALUE,START,LENGHT)
-- Extracts a part of string at a specific position 
-- ?? Retrive all customers's first names removing the first character ??
SELECT FirstName,
substring(FirstName,2,length(FirstName))
from customers