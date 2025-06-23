WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor: start from top-level (CEO)
    SELECT 
        EmployeeID,
		FirstName,
        ManagerID,
        1 AS Level
    FROM employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive: join to find direct reports
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.ManagerID,
        Level + 1 
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT * 
FROM EmployeeHierarchy
