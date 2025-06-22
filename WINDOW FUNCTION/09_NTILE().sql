-- ----------------------------------------INTEGER BASED RANKING--------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- 1 ==> NTILE () :- Divieds the row into a specified number of approximately equal groups 
-- SYNTEX :-      NTILE(2) over (order by Sales Desc) 

-- THEORY:-             NUMBER OF ROWS      
-- BUCKET SIZE =  ---------------------------- (SQL RULE ==> LARGER GROUP COME FIRST IF ROWS NO = ODD)
--                   NUMBER OF BUCKETS(2)

select OrderID,Sales,
ntile(1) over(order by Sales desc) BUCKET_1,
ntile(2) over(order by Sales desc) BUCKET_2,
ntile(3) over(order by Sales desc) BUCKET_3
 from orders;
-- --------------------------------------------USE CASE-------------------------------------------------------
-- ----------------------------------------DATA SEGMENTATION--------------------------------------------------
-- DATA SEGEMENTATION :- Divides a datasets into distinct subsets based on certain criteria

-- ?? SEGMENT all orders into 3 categories high,mideum and low sales 
select OrderID,Sales,
case when   BUCKET_3 =1 then 'HIGH' 
 when   BUCKET_3 =2 then 'MEDIUM'
 when   BUCKET_3 =3 then 'LOW'
end  PERFORMANCE
from
(select OrderID,Sales,
ntile(3) over(order by Sales desc) BUCKET_3
from orders)t;

-- --------------------------------------------USE CASE-------------------------------------------------------
-- IN order to expert the data, divied the orders into 4 groups 
select *,
ntile(4) over(order by  OrderID) BUCKET
from orders;