ALTER TABLE job_applied
    -- on second thoughts lets call it more fittingly
    --and also make the string length unlimites by changing the data type to TEXT
ALTER COLUMN contact_name TYPE TEXT;
SELECT * 
FROM job_applied;