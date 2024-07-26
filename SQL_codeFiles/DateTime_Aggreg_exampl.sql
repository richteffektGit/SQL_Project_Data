-- when we wanna aggregate date functions:
SELECT
    COUNT(job_id) AS n_o_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS col_month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY col_month
ORDER BY n_o_jobs DESC;