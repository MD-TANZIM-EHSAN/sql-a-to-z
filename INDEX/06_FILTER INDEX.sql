-- A FILTERED INDEX is a nonclustered index with a WHERE clause.
-- It only includes rows that match the filter condition.
-- Rows that don't match are not indexed.
-- This improves performance and reduces index size,
-- especially for sparse columns (e.g., lots of NULLs).
-- 📌 Example: Index only rows where IsActive = 1

CREATE NONCLUSTERED INDEX idx_Customers_ActiveEmail
ON dbo.Customers (Email)
WHERE IsActive = 1;

-- ✔️ Only rows with IsActive = 1 are included in the index.
-- ✔️ Queries that filter WHERE IsActive = 1 AND search by Email
--     can use this index efficiently.
-- ✔️ No uniqueness enforced unless you add UNIQUE.SELECT * FROM saledb.ordersarchive;