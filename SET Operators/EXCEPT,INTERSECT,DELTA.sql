-- ------------------------------------------EXCEPT--------------------------------------------------------------------
-- 1==> Return unique rows in 1st table that are not in table 2 
-- 2==> MINUS
-- ?? Find employees who are not customers at the same time 
/*select EmployeeID,FirstName,LastName from employees
EXCEPT
 select CustomerID,FirstName,LastName from customers */
 -- * IN mysql except doest not work 
 
-- ----------------------------------------INTERSECT-------------------------------------------------------------------
-- Returns common rows between tables   
/*SELECT 
    CustomerID, FirstName, LastName
FROM
    customers 
intersect SELECT 
    EmployeeID, FirstName, LastName
FROM
    employees;*/

 -- -----------------------------------DELTA DETECTION------------------------------------------------------------------
-- Identifying the difference or changes(delta) between two batches 
-- identify delta with the use of EXCEPT