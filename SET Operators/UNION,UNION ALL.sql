-- -------------------------------------------------------SET OPERATORS---------------------------------------------
-- Set operator can be used almost in all clauses Where| Join | Group by | HAVING
-- Order by can be used only once
-- Same number of columns 
-- matching data types
-- same order of column 
-- First query control aliases
-- mapping correct columns 
-- ------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------UNION----------------------------------------------------------------
-- 1 ==> Remove all duplicates rows from the results
-- 2 ==> Return all ditrict rows from the results
-- EXAMPLE
SELECT 
    FirstName, LastName
FROM
    customers 
UNION SELECT 
    FirstName, LastName
FROM
    employees;

-- ?? Combine the data from employees and customers into one table ?? 
SELECT 
    CustomerID, FirstName, LastName
FROM
    customers 
UNION SELECT 
    EmployeeID, FirstName, LastName
FROM
    employees; -- output wil be all distinct values 
-- ----------------------------------------UNION ALL --------------------------------------------------------------
-- 1 ==> Return all rows ,including duplicate 
-- ?? Combine the data from employees and customers into one table,includng duplicates ?? 
SELECT 
    CustomerID, FirstName, LastName
FROM
    customers 
UNION ALL  SELECT 
    EmployeeID, FirstName, LastName
FROM
    employees; -- output wil show all  values 