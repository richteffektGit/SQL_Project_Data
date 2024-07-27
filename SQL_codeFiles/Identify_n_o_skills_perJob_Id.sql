SELECT job_id,
    MAX(skill) AS high_mark
FROM(
    SELECT job_id,
        COUNT(skill_id) AS skill
    FROM skills_job_dim
    GROUP BY skills_job_dim.job_id
)
GROUP BY job_id
ORDER BY high_mark DESC