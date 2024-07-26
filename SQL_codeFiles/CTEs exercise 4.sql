/*
hourly rates for non-degree-holders by skill and number of postings
*/

WITH postings_by_rate AS (
    SELECT
            COUNT(job_postings.job_id) AS positions,
            skills_to_job.skill_id,
            AVG(salary_hour_avg) AS hourly_rate
    FROM job_postings_fact AS job_postings
    INNER JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id
    WHERE job_no_degree_mention = TRUE AND salary_hour_avg IS NOT NULL
    GROUP BY skills_to_job.skill_id
    )
SELECT skills.skills AS skill,
    ROUND(hourly_rate,2) AS rate,
    positions
FROM postings_by_rate
INNER JOIN skills_dim AS skills ON postings_by_rate.skill_id = skills.skill_id
GROUP BY skill, postings_by_rate.hourly_rate,postings_by_rate.positions
ORDER BY positions DESC