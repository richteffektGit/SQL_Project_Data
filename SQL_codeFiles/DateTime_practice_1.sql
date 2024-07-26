--write a query to count number of job postings for each month in 2023
-- adjusting the job_posted_date to be in New Yourk before extracting the month
-- (assume it is stored in UTC Group by and order by the month)
SELECT 
    COUNT(job_id) AS jobs_posted,
    EXTRACT (MONTH FROM date_time) AS col_month

FROM (  SELECT job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
                job_id
        FROM job_postings_fact
)
    job_postings_fact

GROUP BY col_month
ORDER BY col_month ASC