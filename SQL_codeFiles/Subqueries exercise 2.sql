-- CSubqueries exercise 2

-- Identify the top 5 skills most frequently mentioned
-- in job postings
-- (find the highest counts in skills_job_dim and join with skills_dim
-- to get the names)

SELECT
 the_skills,
 n_o_jobs
 -- skill_id,
FROM (SELECT skills_job_dim.skill_id,
    COUNT (job_id) AS n_o_jobs,
    skills_dim.skills AS the_skills
    FROM skills_job_dim
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    GROUP BY skills_job_dim.skill_id,skills_dim.skills
    ORDER BY n_o_jobs DESC
    LIMIT 5)