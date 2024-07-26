-- Practice Categorize Salaries
-- put salaries into buckets (high, standard, low, whatev)
-- only look at data analyst roles
-- order from hi - to lo


SELECT job_location,
        salary_year_avg,
    CASE 
    WHEN salary_year_avg < 60000 THEN 'Low'
    WHEN salary_year_avg BETWEEN 60000 AND 89999 THEN 'Standard'
    WHEN salary_year_avg >= 90000 THEN 'High'
    ELSE 'Outlier'
    END AS salary_buckets
FROM job_postings_fact
WHERE job_title_short LIKE '%Data Analyst%' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;