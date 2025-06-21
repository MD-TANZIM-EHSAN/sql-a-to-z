-- ---------------------------------------------AVG-------------------------------------------------------------
-- --------------------------------------------USE CASE----------------------------------------------------------
-- Find the average sales across sales across all order
select OrderID,
avg(Sales) over() 
from orders ;

-- Find the average sales for each product
select OrderID, ProductID,
avg(Sales) over(partition by ProductID) 
from orders ;

-- Find the average scores of customers .Additionall provide details such as CustomerID and LastName
select *,
avg(Score)over(),
Avg(coalesce(Score,0)) Over() -- handle null
from customers;

-- Find all orders where sales are highrer than the average sales across  all orders
SELECT OrderID, Sales
FROM orders
WHERE Sales > (SELECT AVG(Sales) FROM orders);