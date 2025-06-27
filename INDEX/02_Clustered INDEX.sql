-- =========================================
-- 🌳 CLUSTERED INDEX B-TREE STRUCTURE
-- =========================================
-- • B-Tree used to store data physically sorted by indexed column.
-- • Leaf nodes contain actual table rows (not just pointers).
-- • Only one clustered index per table.
-- • Very fast for equality and range filtering on index column.
-- • Efficient for ORDER BY and BETWEEN queries.
-- • Commonly built on the PRIMARY KEY.
-- =========================================
/*         
           [50]
         /     \
     [20]       [70]
    /   \      /    \
[10] [30]  [60]   [80]

ID is the clustered index, and the table is stored in a B-Tree sorted by ID.
Now when you run:
-- =========================================
SELECT * FROM employees WHERE ID = 30;
-- =========================================
DB starts at root (50)
Since 30 < 50, it goes left to [20]
30 > 20 → go to [30] → 🔥 Found!
✅ No need to scan the entire table.*/

CREATE CLUSTERED INDEX idx_EmployeeID
ON Employees (EmployeeID);
DROP INDEX idx_EmployeeID ON Employees;


-- (MySQL - Clustered Index)
-- ================================================
-- 🌳 CLUSTERED INDEX IN MYSQL (INNODB ENGINE)
-- ================================================
-- • InnoDB tables always have a clustered index.
-- • If a PRIMARY KEY is defined → it becomes the clustered index.
-- • If no PRIMARY KEY:
--     - The first UNIQUE NOT NULL column is used.
-- • If neither exists:
--     - InnoDB creates a hidden clustered index using an internal row ID.
-- • You cannot manually create a clustered index in MySQL.
-- ================================================