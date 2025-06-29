-- MONITORING INDEX USAGE
SELECT
    idx.name AS IndexName,      -- Get the index name
    s.user_scans,               -- How many times that index was scanned fully
    s.last_user_scan            -- When was the last scan
FROM sys.indexes idx
JOIN sys.tables tbl             -- Join to get table info (not shown in SELECT here)
    ON idx.object_id = tbl.object_id
LEFT JOIN sys.dm_db_index_usage_stats s  -- Join to usage stats DMV
    ON s.object_id = idx.object_id
   AND s.index_id = idx.index_id
ORDER BY tbl.name, idx.name;    -- Sort nicely by table name and index name
-- =============================================================================================================
-- MONITORING Duplicate Index
SELECT 
    tbl.name AS TableName,
    col.name AS IndexColumn,
    idx.name AS IndexName,
    idx.type_desc AS IndexType,
    COUNT(*) OVER (PARTITION BY tbl.name, col.name) AS ColumnCount
FROM sys.indexes idx
JOIN sys.tables tbl ON idx.object_id = tbl.object_id
JOIN sys.index_columns ic ON idx.object_id = ic.object_id 
    AND idx.index_id = ic.index_id
JOIN sys.columns col ON ic.object_id = col.object_id 
    AND ic.column_id = col.column_id
ORDER BY ColumnCount DESC;
-- =============================================================================================================
-- MONITORING missing Index
select * from sys.dm_db_missing_index_details