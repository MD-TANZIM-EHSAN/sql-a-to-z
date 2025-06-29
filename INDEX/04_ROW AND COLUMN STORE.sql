-- Create a HEAP copy of FactInternetSales
SELECT *
INTO FactInternetSales_HP
FROM FactInternetSales;
-- ======================================================================
-- Create a Rowstore copy of FactInternetSales
SELECT *
INTO FactInternetSales_RS
FROM FactInternetSales;
-- Add Clustered Index to the Rowstore copy
CREATE CLUSTERED INDEX idx_FactInternetSales_RS_PK
ON FactInternetSales_RS (SalesOrderNumber, SalesOrderLineNumber);
-- ================================================================
-- Create a Columnstore copy of FactInternetSales
SELECT *
INTO FactInternetSales_CS
FROM FactInternetSales;

-- Add Clustered Columnstore Index to the Columnstore copy
CREATE CLUSTERED COLUMNSTORE INDEX idx_FactInternetSales_CS_PK
ON FactInternetSales_CS;SELECT * FROM saledb.ordersarchive;
-- =======================================================================
-- Storage efficient
-- 1 columnstore index
-- 2 Heap 
-- 3 Row store cluste index