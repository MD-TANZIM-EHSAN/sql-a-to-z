-- -------------------------------------JOINING MULTI TABLE------------------------------------------------------------
-- ?? Using saledb,Retrive a list of all orders ,along with the related customer,product and employee details
-- For Each order display order id,customers name,product name,sales,price,sales person's name
select o.OrderID,
       o.Sales,
       c.FirstName,
       c.LastName,
       p.Product,
       p.Price,
       e.FirstName as EMPLOYEE_NAME
from orders as o
left join customers as c
on o.CustomerID=c.Customerid
left join products as p
on o.ProductID=p.ProductID
left join employees as e
on o.SalesPersonID= e.EmployeeID
 