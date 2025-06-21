-- ----------------------------------------INTEGER BASED RANKING--------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- 1 == > ROW_NUMBER() :- Assign a unique number to each row 
-- 						- it does not handle ties
-- SYNTEX ==> ROW_NUMBER() OVER (ORDER BY sales DESC)

/*
| OrderID | CustomerID | Sales |
| ------- | ---------- | ----- |
| 1       | C001       | 300   |
| 2       | C002       | 500   |
| 3       | C003       | 300   |
| 4       | C004       | 500   |
| 5       | C005       | 300   |*/
SELECT 
    OrderID,
    CustomerID,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales DESC) AS RowNum
FROM orders;

-- OUTPUT:-
/*| OrderID | CustomerID | Sales | RowNum |
| ------- | ---------- | ----- | ------ |
| 2       | C002       | 500   | 1      |
| 4       | C004       | 500   | 2      |
| 1       | C001       | 300   | 3      |
| 3       | C003       | 300   | 4      |
| 5       | C005       | 300   | 5      | */

-- Even if values are the same in the ORDER BY column,
--  ROW_NUMBER() still assigns a unique row number to each row — it does not allow ties.

