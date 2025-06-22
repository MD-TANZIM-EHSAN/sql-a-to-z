-- ----------------------------------------INTEGER BASED RANKING--------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- 1 == > DENSE_RANK() :- Assigns same rank to tied rows.
-- 						- Does NOT skip any rank numbers.
--                      - Use when you want ties handled but no gaps in ranks.
-- SYNTEX ==> DENSE_RANK() OVER (ORDER BY sales DESC)
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
  DENSE_RANK() OVER (ORDER BY Sales DESC) AS DenseRank
FROM orders;
-- OUTPUT :-
/*
| OrderID | Sales |DenseRank |
| ------- | ----- | ---------|
| 1       | 500   |     1    |
| 2       | 300   |     2    |
| 3       | 300   |     2    |
| 4       | 200   |     4    |
*/