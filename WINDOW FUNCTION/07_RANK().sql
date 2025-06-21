-- ----------------------------------------INTEGER BASED RANKING--------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- 1 == > RANK() :- Assign a RANK  to each row 
-- 						- it handle ties
--                      - it leaves gaps in ranking
-- SYNTEX ==> RANK() OVER (ORDER BY sales DESC)
/* 
| OrderID | Sales |
| ------- | ----- |
| 1       | 500   |
| 2       | 300   |
| 3       | 300   |
| 4       | 200   |
*/
SELECT 
  OrderID,
  Sales,
  RANK()       OVER (ORDER BY Sales DESC) AS RankNum
FROM orders;
-- OUTPUT :- 
/*| OrderID | Sales | RankNum |
| ------- | ----- | ------- | 
| 1       | 500   | 1       | 
| 2       | 300   | 2       | 
| 3       | 300   | 2       |
| 4       | 200   | 4       |*/
