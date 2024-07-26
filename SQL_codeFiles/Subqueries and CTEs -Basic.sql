-- Subqueries and CTEs (Common Table Expressions)
-- useful to organise bigger and more complex queries
-- break it down int smaller, manageable parts:
-- Subqueries: simpler queries
-- CTE more complex queries
-- (Subquery here is just a nested query)

SELECT *
FROM(SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
   ) AS janaury_jobs;

--Whereas CTEs define a temporary result we can reference within
         -- SELECT, INSERT, UPDATE, or DELETE
-- Defined with WITH

WITH january_jobs AS( --CTE expression starts here:
    
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    )
    SELECT*
    FROM january_jobs;