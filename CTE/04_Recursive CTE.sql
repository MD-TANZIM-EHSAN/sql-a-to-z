WITH RECURSIVE Series AS (
    -- Anchor member
    SELECT 1 AS MyNumber

    UNION ALL

    -- Recursive member
    SELECT MyNumber + 1
    FROM Series
    WHERE MyNumber < 1000
)
SELECT * 
FROM Series;
