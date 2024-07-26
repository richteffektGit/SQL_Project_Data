--write a query to find companies that have posted jobs offering health insurance
-- where these postings were made in the second quarter of '23
--SELECT job_title_short,
--job_location
--FROM job_postings_fact
--WHERE job_health_insurance = TRUE

SELECT job_title_short,
    company_dim.name AS company,
    col_month,
    job_location
FROM (SELECT EXTRACT (MONTH FROM job_posted_date) AS col_month,
    job_title_short,
    company_id,
    job_health_insurance,
    job_location
    FROM job_postings_fact)
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_health_insurance = TRUE AND col_month BETWEEN 4 AND 6