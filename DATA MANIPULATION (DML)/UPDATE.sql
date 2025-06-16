-- --$$ Always use where tio avoid updating all rows unintentionally  $$$ ------
-- check with select before running update to avoid updaing the wrong data-----

-- Change the Score of customer 6 to 0 ---------
SET SQL_SAFE_UPDATES = 0;
Update customers
set Score = 0
where CustomerID = 6; -- -------$$ without where all row will be updated $$ --------
-- Change the score of customer 8 to 0 and change the first name to md----------------
SET SQL_SAFE_UPDATES = 0;
Update customers
set Score = 0,
    FirstName = 'md'
where CustomerID = 8;

/*update all customers with a Null Score BY setting their score to 0*/
update customers
Set Score =0
where Score is null