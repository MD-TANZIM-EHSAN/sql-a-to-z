-- DISTINCT
-- Return unique list of all country
select distinct(Country)
from customers;

-- Retrive only 3 customers 
SELECT * FROM customers
LIMIT 3;
 -- Retrive the top  3 customers  with the highest score
 select * from customers
 order by Score desc
 limit 3;
 -- Retrive the lowest 2  customers  with the highest score
 select * from customers
 order by Score asc
 limit 2