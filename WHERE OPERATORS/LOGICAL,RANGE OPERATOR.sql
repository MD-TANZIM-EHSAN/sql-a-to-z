-- [ AND ] --> All conditions must be true
-- ?? Retrive all customer who are from the usa AND have a score  greater than 500 -------
select * from customers 
where Country ='USA' AND Score >500;
-- -----------------------------------------------------------------------------------------------------------------
-- [ OR ] --> At least one condition must be true
-- ??Retrive all customer who are either from the usa or have a Score greater than 500 ??
select * from customers 
where Country = 'USA' or Score > 500 ;
-- -------------------------------------------------------------------------------------------------------------------
-- [ NOT ] (Reverse) Exclusdes matching values 
-- ?? Retrive all customerswith a score NOT less than 500 
select * from customers 
where  Not  Score < 500;
-- -------------------------------------------------------------------------------------------------------------------
-- [ BETWEEN ] Checks if value is within in range
-- ?? Retrive all customers whose score falls in the range BETWEEN 100 and 500 
select * from customers 
where Score Between 100 and 500
