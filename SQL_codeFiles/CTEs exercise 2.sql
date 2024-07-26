-- CTEs exercise 2

-- Identify the top 5 skills most frequently mentioned
-- in job postings
-- (find the highest counts in skills_job_dim and join with skills_dim
-- to get the names)

WITH five_top_skills AS (
    SELECT count (job_id) AS n_o_jobs,
        skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY n_o_jobs DESC
    LIMIT 5
    )
SELECT skills_dim.skill_id,
    skills_dim.skills,
    five_top_skills.n_o_jobs
FROM skills_dim
LEFT JOIN five_top_skills ON skills_dim.skill_id = five_top_skills.skill_id
WHERE n_o_jobs IS NOT NULL