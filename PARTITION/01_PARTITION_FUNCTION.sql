-- -------------------------------------------PARTITION-----------------------------------------------------------------
-- Easier maintenance
-- You can drop, add, or exchange partitions without affecting the rest of the data.
-- Example: Drop old data — ALTER TABLE DROP PARTITION p2023;
-- ==========================================================================================================
-- Query performance
-- If you use partition pruning, the database only scans relevant partitions.
-- Example: If you run
-- SELECT * FROM orders WHERE YEAR(order_date) = 2024;
-- MySQL will only read the p2024 partition.
-- ==========================================================================================================
-- PARTITION FUNCTION :- Define the logic how to devide your data into partition  
-- Step 1 :- create partition  function 
-- SQL Server syntax example
CREATE PARTITION FUNCTION PartitionByYear (DATE)
AS RANGE LEFT FOR VALUES ('2023-12-31', '2024-12-31', '2025-12-31');

-- Here’s how you would do range partitioning by year in MySQL:
CREATE TABLE my_table (
    id INT,
    order_date DATE
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026)
);
-- ===================================================================================================
-- In SQL Server, if you want to list all existing partition functions, you can query the system catalog views.
SELECT 
    pf.name AS PartitionFunctionName,
    pf.type_desc AS FunctionType,
    ps.name AS PartitionSchemeName
FROM sys.partition_functions AS pf