/*
identify what is in high demand and ahigh paying skill
    (check also my own version of Query number 4_  for this)
    let's focus on remote positions with specified salaries (not Null)
*/

-- our friend Luke wrote it like this
-- to be most concise)

SELECT
        COUNT (job_postings_fact.job_id) AS n_o_jobs,
        skills AS skills_to_job,
        sj_dim.skill_id AS main_skill_id,
        ROUND(AVG (salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim AS sj_dim ON job_postings_fact.job_id = sj_dim.job_id
    INNER JOIN skills_dim   ON sj_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    GROUP BY main_skill_id, skills_to_job
    -- we cannot have an aggregation inside the WHERE so there's the HAVING:
    HAVING COUNT(sj_dim.job_id) > 10
    ORDER BY n_o_jobs DESC,
        avg_salary DESC
    LIMIT 50;