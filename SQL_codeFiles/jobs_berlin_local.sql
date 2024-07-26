WITH jobs_berlin_local AS (
    SELECT 
        DISTINCT job_postings.job_location,
        job_postings.job_id,
        job_postings.company_id,
        job_postings.salary_year_avg,
        job_postings.job_title_short,
        skills_to_job.skill_id
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
    WHERE job_location LIKE 'Berlin, Germany%' -- AND salary_year_avg IS NOT NULL
    )
SELECT DISTINCT job_location,
        skills.skills,
        salary_year_avg,
        company_dim.name AS company,
        job_title_short
FROM jobs_berlin_local
INNER JOIN skills_dim AS skills ON jobs_berlin_local.skill_id = skills.skill_id
LEFT JOIN company_dim ON jobs_berlin_local.company_id = company_dim.company_id
WHERE job_title_short LIKE '%Data Analyst%'
ORDER BY company

