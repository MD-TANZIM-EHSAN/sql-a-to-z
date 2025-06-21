-- ---------------------------------------------MIN MAX-------------------------------------------------------------
-- --------------------------------------------USE CASE----------------------------------------------------------

-- 1 ==>Find the highest and lowest  sales of all orders
select OrderID,max(Sales) OVER(),Min(Sales) OVER() 
 from orders;
 -- 2==> Find the highest and lowest sales for each product
 select ProductID,
 min(Sales) over(partition by ProductID), max(Sales) over(partition by ProductID)
 from orders;
 -- 3==> Show  the employees who have the highest salaries 
 select EmployeeID,
 max(Salary) max
 from employees
 group by EmployeeID
 order by   max(Salary)  desc;
-- SUBQUERY 
select * from(
select *
, max(Salary) Over() max_salary from employees)t 
where Salary = max_salary;

-- 4 ==> Calculate the diviation of each sale from both the minimum and maximum sales amount

SELECT 
    OrderID,
    Sales,
    Sales - (SELECT MIN(Sales) FROM orders) AS Deviation_From_Min,
    (SELECT MAX(Sales) FROM orders) - Sales AS Deviation_From_Max
FROM orders;
--
select OrderID,Sales,
min(Sales) over(),
max(Sales) over(),
Sales - min(Sales) over(),
max(Sales) over() - Sales
 from orders