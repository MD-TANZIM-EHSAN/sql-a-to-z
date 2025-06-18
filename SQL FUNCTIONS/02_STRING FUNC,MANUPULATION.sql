-- ------------------------------------------STRING FUNCTION---------------------------------------------------------
-- -------------------------------------------MANUPULATION----------------------------------------------------------- 
-- 1==> CONCAT - Combine multiple string into one 
-- 2==> UPPER  - Converts all characters to uppercase 
-- 3==> LOWER  - Converts all characters to lowercase 
SELECT 
    FirstName,
    Country,
    CONCAT(FirstName, ' ', Country) AS NAME_COUNTRY,
    LOWER(FirstNAME) AS LOW_NAME,
    UPPER(FirstNAME) AS UPPER_NAME
FROM
    customers;
-- ------------------------------- 4==> ------ TRIM -----------------------------------------------------------------
-- Removes Leading and trailing spacese
-- ?? HOW TO FIND IF THERE ANY BLANK SPACES IN ROW ?? 
SELECT 
    FirstName
FROM
    customers
WHERE
    FirstName != TRIM(FirstName);
-- If you find any spaces then trim that columns
SELECT 
    FirstName, TRIM(FirstName) AS TRIM_NAME
FROM
    customers;

-- ------------------------------- 5==> ----REPLACE---------------------------------------------------------------
-- Replaces specific character with a new character
select
'123-456-789' AS OLD_NUM,
REPLACE('123-456-789','-','') AS NEW_NUM