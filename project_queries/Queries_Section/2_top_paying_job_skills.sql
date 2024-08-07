/*
What skills are required for those top paying roles?

- identify top 10 highest paying D.A. as in (1_...)
- Find the skills required for the roles
Highlight the top paying opportunities for D.A.,
    offering insights what skills are required and align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        company_dim.name AS company_name,
        ROUND(salary_year_avg,2) AS yearly_salary
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    )
SELECT top_paying_jobs.*, --to selct everything called earlier
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
--bc. we only care about jobs that have skills listed
--so that we can learn about them-
ORDER BY yearly_salary DESC
