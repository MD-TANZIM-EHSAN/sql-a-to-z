-- ----------------------------------------PERCENTAGE BASED RANKING--------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------
-- CUME_DIST() == > Cumulative Distribution calculates the distribution of data points within a window
-- Syntex :- CUME_DIST() OVER (order by Sales desc)

-- THEORY:                 POSITION NO
--        CUME_DIST = --------------------------
--                        NUMBER OF ROWS

/*📊 Example Table: sales
| Employee | Sales |
| -------- | ----- |
| Alice    | 500   |
| Bob      | 400   |
| Carol    | 400   |
| Dave     | 300   |
| Emma     | 200   |
*/
-- ✅ Query:
SELECT 
  Employee,
  Sales,
  CUME_DIST() OVER (ORDER BY Sales) AS cum_dist
FROM sales;
/* 🧾 Output:
| Employee | Sales | cum\_dist |
| -------- | ----- | --------- |
| Emma     | 200   | 0.20      |
| Dave     | 300   | 0.40      |
| Bob      | 400   | 0.80      |
| Carol    | 400   | 0.80      |
| Alice    | 500   | 1.00      |
*/
-- -------------------------------------------------------------------------------------------------------------
-- 2 ==> Calculate the relative position of each row
-- SYNTEX :- PARCENT_RANK() Over (ORDER BY SALES desc)
-- THEORY:                 POSITION NO - 1
--        CUME_DIST = --------------------------
--                        NUMBER OF ROWS -1 

 -- ?? FIND THE PRODUCTS that fall within the highest 40% of prices
 SELECT *
FROM (
  SELECT 
      ProductID,
      Price,
      CUME_DIST() OVER (ORDER BY Price DESC) AS price_percentile
  FROM products
) ranked_products
WHERE price_percentile <= 0.40;  -- Top 40% of prices

 
