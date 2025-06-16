-- ( = ) Checks if two values are equal --
-- retrive all customer from Germany 
select * from customers
where Country  = 'Germany';
-- -----------------------------------------------------------------------------------------------------------------
-- [ <> != ] Checks if two values are not equal 
-- Retrive all customers who are not from germany
select * from customers 
where Country <> 'Germany';
-- -----------------------------------------------------------------------------------------------------------------
-- [ > ] Checks if a value is greater than another value
-- Retrive all customers with a score greater than 500
select * from customers
where Score > 500;
-- ------------------------------------------------------------------------------------------------------------------
-- [ >= ] Checks if a values is greater than or equaql to another value
-- ??Retrive all customer with a score of 500 or more??
select * from customers
where Score >= 500 ;
-- ------------------------------------------------------------------------------------------------------------------
-- [ < ] checks if a value is less than another value 
-- ?? retrive all cstomers with a score less than 500 
select * from customers 
where score < 500;
-- ------------------------------------------------------------------------------------------------------------------
-- [ <= ] Checks if a value is less than or equal to another value
-- ??Retrive all customers with a score of 500 or less
select * from customers 
where Score <= 500;