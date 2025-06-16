-- ORDER BY
-- Retrive All customers and sort the results by the highest score first
Select * from customers
order by Score desc;
-- Retrive All customers and sort the results by the lowest score first
Select * from customers 
order by Score asc;
-- Retrive all customers and sort the results by the country and then by the higherst score
select * from customers
order by Country asc,
Score desc