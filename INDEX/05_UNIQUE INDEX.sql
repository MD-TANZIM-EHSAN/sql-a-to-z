-- A UNIQUE INDEX:
-- - Ensures that the indexed column(s) contain only unique values.
-- - Prevents duplicate data.
-- - Is created automatically when you define a PRIMARY KEY or UNIQUE CONSTRAINT.
-- Note: A PRIMARY KEY is just a special case of a unique index.
-- ===========================================================================================================
-- Use Cases:
-- 1) Enforce business rules: e.g., ensure Email in Customers is unique.
-- 2) Support fast lookups: quickly search by unique fields.
-- 3) Data integrity: prevent duplicate rows for keys.
-- ===========================================================================================================
-- 🟢 1) UNIQUE INDEX on one column
CREATE UNIQUE INDEX idx_Customers_Email
ON dbo.Customers (Email);
-- Enforces that each Email must be unique in the Customers table.

-- 🟢 2) UNIQUE INDEX on multiple columns (composite key)
CREATE UNIQUE INDEX idx_Orders_CustomerOrder
ON dbo.Orders (CustomerID, OrderNumber);
-- The combination of CustomerID and OrderNumber must be unique.
-- ==============================================================================================================
-- Use DROP INDEX — but remember the syntax is slightly different for SQL Server vs MySQL:
-- SQL Server:
-- Syntax: DROP INDEX [index_name] ON [table_name]
DROP INDEX idx_Customers_Email ON dbo.Customers;
-- ==============================================================================================================
-- ✅ 3️⃣ What happens if you try to insert duplicates
-- 📌 Example: Assume you have a UNIQUE INDEX on the Email column
CREATE UNIQUE INDEX idx_Customers_Email
ON dbo.Customers (Email);
-- This ensures that each Email must be unique in the Customers table


-- ✅ This insert will succeed
INSERT INTO dbo.Customers (Email)
VALUES ('test@example.com');  -- OK: First insert, value does not exist yet


-- ❌ This insert will fail because it violates the UNIQUE constraint
INSERT INTO dbo.Customers (Email)
VALUES ('test@example.com');  -- ERROR: Duplicate value. Violates UNIQUE INDEX.
