-- insert data from 'customers' into 'persons'
-- insert using select --
INSERT INTO persons(id,person_name,birth_of_date,phone)
select CustomerID,FirstName,NULL,'NOT AVAILABLE'
from customers 