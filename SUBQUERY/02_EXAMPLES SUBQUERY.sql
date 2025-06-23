-- --------------------------------------FROM -------------------------------------------------------------
-- FIND THE PRODUCTS THAT HAVE A PRICE HIGHER THAN THE AVERAGE PRICE OF ALL PRODUCTS
-- Rank the customer based on their total amounts of sales
select *, RANK() OVER(order by TOTAL_SALES desc)  
from
(select CustomerID,
sum(Sales)   TOTAL_SALES 
from orders
group by CustomerID
)t;
-- --------------------------------------SELECT-------------------------------------------------------------
-- show the product id, product name, price and total no of orders
-- RULE ==>> only scaler subqueris are allowed to be used
select ProductID,Product,Price,
(select count(1) from orders) as total_orders
 from products;
-- --------------------------------------join -------------------------------------------------------------
-- Show all customers details and find the total orders for each customers
select c.*,t.total_orders from customers c
Join (select CustomerID,
count(1)  total_orders
 from orders
 group by CustomerID )t
on c.CustomerID =t.CustomerID;
-- --------------------------------------WHERE -------------------------------------------------------------
-- RULE ==>> only scaler subqueris are allowed to be used
-- Find the products that have a price higher than the average price of all products
select * from products 
where Price > (select avg(Price) from products);
-- -------------------------------------NOT IN IN-------------------------------------------------------------
-- Show the details of orders made by customers in germany
select * from orders
where CustomerID in (select CustomerID from customers where Country = 'Germany');

select * from orders
where CustomerID not in (select CustomerID from customers where Country = 'Germany');
-- --------------------------------------ANY ALL -------------------------------------------------------------
 -- Find Female employees whose salaries are greater than the salaries of any male employees
 select EmployeeID,FirstName,Salary from employees
 where Gender = 'F' and Salary > any
 (select Salary from employees
 where Gender = 'M');
  -- Find Female employees whose salaries are greater than the salaries of any male employees
  select EmployeeID,FirstName,Salary from employees
 where Gender = 'F' and Salary > all
 (select Salary from employees
 where Gender = 'M');
 -- -----------------------------------------------------------------------------------------------------------
 -- Show all customer details and find the total orders for each customer
 select c.CustomerID,t.total_orders from customers c 
 join 
 (select CustomerID,count(*) total_orders
 from orders 
 group by CustomerID)t
 on c.CustomerID = t.CustomerID;
 -- ---- another way to solve 
 select *,
 (select count(1) from orders o where o.CustomerID = c.CustomerID) Count_no
 from customers c;
 -- --------------------------------------EXIST -------------------------------------------------------------
 select * from orders o
where Exists (select 1 from customers c where Country = 'Germany' and o.CustomerID=c.CustomerID);

 select * from orders o
where NOT Exists (select 1 from customers c where Country = 'Germany' and o.CustomerID=c.CustomerID);