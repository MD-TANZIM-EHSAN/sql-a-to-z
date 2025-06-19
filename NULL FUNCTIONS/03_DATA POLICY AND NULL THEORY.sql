-- SQL Code
WITH Orders AS (
    SELECT 1 AS Id, 'A' AS Category UNION
    SELECT 2, NULL UNION
    SELECT 3, '' UNION
    SELECT 4, ' '
)
SELECT 
    *,
    TRIM(Category) AS Policy1,
    NULLIF(TRIM(Category), '') AS Policy2,
    COALESCE(NULLIF(TRIM(Category), ''), 'unknown') AS Policy3
FROM Orders;
/*🔍 Explanation
Column	What It Does
Policy1	Just trims whitespace from Category.
Policy2	Returns NULL if trimmed value is empty (''), otherwise returns the value.
Policy3	First applies NULLIF() as above, then replaces NULL with 'unknown'.*/

/*
🟨 NULL Functions
NULLs are special markers that mean missing value.

Using NULLs can optimize storage and performance.

📦 Functions
🔹 COALESCE | ISNULL
→ Returns the first non-null value
→ ISNULL(NULL, 30) → 30

🔹 NULLIF
→ Returns NULL if values are equal
→ NULLIF(30, 30) → NULL

🔹 IS NULL | IS NOT NULL
→ Used for boolean checks
→ Returns TRUE or FALSE

✅ USE CASES
✅ Handle NULLs – Data Aggregation

✅ Handle NULLs – Mathematical Operations

✅ Handle NULLs – Joining Tables

✅ Handle NULLs – Sorting Data

✅ Finding unmatched data – Left Anti Join

✅ Data Policies – Replacing NULLs with a default value