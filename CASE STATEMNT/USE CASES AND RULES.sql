-- -----------------------------------------CASE STATEMENT--------------------------------------------------------------
-- USE CASE - CATEGORIZING DATA : - Group the data into different categories based on certain condition

/* Generating a report showing the total sales for each category 
-HIGH: if the sales higher than 50 
-MEDIUM : if the sale between 20 and 50 
-LOW : if the sales less than 20 and less*/
select CATEGORY,
sum(Sales) as total_Sale
from (select OrderID,Sales,
 case 
     when Sales  > 50 then 'HIGH'  -- data type must be same for all condition is the only rule for this statement
     when Sales > 20   then 'medium'
     else 'low'
     END CATEGORY
     from orders)t
group by CATEGORY
order by total_Sale desc;
-- ------------------------------------------------------------------------------------------------------------------
-- USE CASE - Mapping Value : Transform the values from one from to another 
-- ?? Retrive employee details with gender displayed as full text ??
select EmployeeID,Gender,
case 
     when Gender = 'M' then 'Male'
     when Gender = 'F' then 'Female'
     else 'Not available'
     end full_form_gender
 from employees;
 
 -- ?? Retrive all customers details with abbreviated country code ?? 
 select Distinct(Country) from customers;
 select CustomerID,Country,
 CASE 
      when country = "Germany" then "DE"
      when Country = "USA" then "US"
	  ELSE "others"
      end short_form
 
 from customers;
 -- -----------------------------------------------------------------------------------------------------------------
 -- USE CASE :- Handling Null ==> Replace NULL with a specific value.
 -- ?? FIND THE AVERAGE scores of customers and treat null as 0
 
 select CustomerID,LastName ,
 case when Score is null then 0
 else Score
 end con,
 avg( case when Score is null then 0
 else Score
 end) over () AVERAGE
 from customers;
 
 -- Conditiona Aggregation
 -- ?? Count how many times each customer has made an order with sales greater than 30
 select CustomerID,
 SUM(case 
  when Sales > 30 then  1
  else 0
  end ) t
 from orders
group by CustomerID
 order by CustomerID;
-- WHERE 
select CustomerID, count(*)
 from orders
 where Sales > 30
group by CustomerID
order by CustomerID
 