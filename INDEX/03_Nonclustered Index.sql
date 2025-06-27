-- ================================================
-- ✅ CREATE NON-CLUSTERED INDEX IN MYSQL (INNODB)
-- ================================================
-- • Use CREATE INDEX to create a secondary (non-clustered) index.
-- • Primary key acts as clustered index automatically.
-- • Secondary indexes store index keys and pointers to clustered index rows.
-- • Improves search speed on columns other than primary key.
-- ================================================
CREATE INDEX index_name
ON table_name (column_name);
DROP INDEX index_name ON table_name;