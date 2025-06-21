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
-- ----------------------------------IDENTIFY DUPLICATE --------------------------------------------------------------
-- ?? Identify duplicat rows in the table Order ARCHIVE and return a clean result 
SELECT * FROM
(select  OrderID, CreationTime,
row_number() Over(partition by OrderID order by CreationTime desc) rn
from ordersarchive)t
where rn = 1;
-- -----------------------------------------------------------------------------------------------------------------
/*ASSIGNING 
1. ✅ Pagination in Frontend Apps
📱 Web pages and dashboards don’t show thousands of rows at once — they need to page data (e.g., rows 11–20).
Assigning a ROW_NUMBER() lets you easily select a specific range of rows:

WHERE row_num BETWEEN 21 AND 30;
*/
WITH numbered_orders AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY OrderID) AS row_num
    FROM ordersarchive
)
SELECT *
FROM numbered_orders
WHERE row_num BETWEEN 21 AND 30;

-- ✅ Simulating Primary Keys
-- In raw datasets or staging tables where no id exists, you can generate one:

SELECT ROW_NUMBER() OVER (ORDER BY any_column) AS id
FROM staging_data;

