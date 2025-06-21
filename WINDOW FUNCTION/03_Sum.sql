-- -----------------------------------------------SUM--------------------------------------------------------------------
-- FIND the total sales across all order and total sale for each product
select CustomerID,Sales,ProductID,
sum(Sales) over() total_sales,
sum(Sales) over(partition by ProductID) EACH_PRODUCT_SALES
from orders;
-- find the percentage Contribution  of each products sales to the total sales
select OrderID, CustomerID,Sales,ProductID,
sum(Sales) over(),
ROUND(Sales/sum(Sales) over() * 100,2 )
from orders;
select* from orders