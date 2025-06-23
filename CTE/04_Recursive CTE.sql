/*
-----------------------------------------------
 Recursive CTE Execution Flow: Generate Numbers
-----------------------------------------------

Step 1: Anchor Member
         1
Step 2: Recursive Member
         2 (1 + 1)
         3 (2 + 1)
         4 ...
         .
         .
         1000 (until condition MyNumber < 1000 fails)

Final Output:
         1
         2
         3
         ...
         1000
-----------------------------------------------
*/

WITH RECURSIVE Series AS (
    SELECT 1 AS MyNumber -- Anchor member
    UNION ALL
    SELECT MyNumber + 1  -- Recursive member
    FROM Series
    WHERE MyNumber < 1000
)
SELECT * FROM Series;
