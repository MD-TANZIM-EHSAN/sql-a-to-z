-- -------------------------------------MEMBERSHIP OPERATOR ----------------------------------------------------------
-- [ IN ] Checks if  a value exists in a list 
-- ?? Retrive all customers from either Germany or US 
Select * from customers 
where Country in ('Germany','USA') ;
-- --------------------------------------------------------------------------------------------------------------------
-- [ Not IN ]-----
-- ??Show customers not from GERMANY or USA --
select * from customers 
where Country Not in ('Germany','USA');
-- ------------------------------------------ LIKE OPERATOR ---------------------------------------------------------
-- SEARCH for a pattern in text
-- ?? FIND all customers whose first name end with 'n'--
select * from customers 
where FirstName like '%n'; -- ehsan is correct but jhonny is  not correct

-- ??  Find all customerswhose first name has 's' in the 3rd position ??
Select * from customers
where FirstName like '__s%'

