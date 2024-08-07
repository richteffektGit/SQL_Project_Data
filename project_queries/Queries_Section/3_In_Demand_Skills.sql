/*
What are the most in-demand skills for Data Analysts?
We want to know the 5 most in-demand skills for a data analyst
    to learn which skills are the most valuable to have right now.
*/

SELECT
    COUNT (job_postings_fact.job_id) AS n_o_jobs,
    skills AS skills_to_job,
    skills_dim.type AS skill_type
FROM job_postings_fact
INNER JOIN skills_job_dim AS sj_dim ON job_postings_fact.job_id = sj_dim.job_id
INNER JOIN skills_dim   ON sj_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND (job_location LIKE 'Berlin%' OR job_location = 'Anywhere')
    --adding these for personal interest obv., note
    -- globally (including Remote jobs, it's SQL, Excel, Python, Tableau, PowerBI) so very similar
GROUP BY skills_to_job, skill_type
HAVING COUNT (job_postings_fact.job_id) > 10
ORDER BY n_o_jobs DESC