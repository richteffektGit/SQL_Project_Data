-- CTEs exercise1
-- for a temporary result set (exists only during the duration of the query)

--let's find companies that have the most job openings
-- (get total number/jobs (per company) with comp. name (in Company_Dim))
-- the JOIN is Left with A/left being company dim so that
-- in case there are companies w/ no postings they will be listed but w/ zero)
-- so B/right is our fact table

WITH company_job_count AS ( 
    SELECT company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id

)
SELECT company_dim.name AS company,
company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC