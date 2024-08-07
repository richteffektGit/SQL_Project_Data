/*
What are the top paying data-analyst-job postings?

- identify top 10 highest paying D.A. roles available remotely
- Focus on postings with specified salaries (no Nulls!)
Why? - Highlight the top paying opportunities for D.A., offering insights
*/

SELECT 
    job_title,
    job_location,
    company_dim.name AS company_name,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    -- AND job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;