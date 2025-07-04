-- FILEGROUPS :- Logical container of one or more data files to help organize partition
ALTER DATABASE saledb ADD FILEGROUP FG_2023
ALTER DATABASE saledb REMOVE FILEGROUP FG_2023
-- ==========================================================================================================
-- QUERY LISTS ALL EXISTING FILEGROUPS
SELECT * FROM sys.filegroups
WHERE TYPE = 'FG'
-- ==========================================================================================================
-- DATAFILE:
-- Add data file for 2023 partition
ALTER DATABASE SalesDB 
ADD FILE 
(
    NAME = P_2023,  -- Logical name
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2023.ndf'
) TO FILEGROUP FG_2023;

-- Add data file for 2024 partition
ALTER DATABASE SalesDB 
ADD FILE 
(
    NAME = P_2024,  -- Logical name
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2024.ndf'
) TO FILEGROUP FG_2024;

-- Add data file for 2025 partition
ALTER DATABASE SalesDB 
ADD FILE 
(
    NAME = P_2025,  -- Logical name
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2025.ndf'
) TO FILEGROUP FG_2025;

-- Add data file for 2026 partition
ALTER DATABASE SalesDB 
ADD FILE 
(
    NAME = P_2026,  -- Logical name
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2026.ndf'
) TO FILEGROUP FG_2026;
-- ==========================================================================================================
SELECT
    fg.name AS FilegroupName,
    mf.name AS LogicalFileName,
    mf.physical_name AS PhysicalFilePath,
    mf.size / 128 AS SizeInMB
FROM sys.filegroups AS fg
JOIN sys.master_files AS mf 
    ON fg.data_space_id = mf.data_space_id
WHERE mf.database_id = DB_ID('SalesDB');