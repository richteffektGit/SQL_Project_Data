/*
MY prompt: i have two columns one named "job"  listing the job
the other called "skill" listing the skills for the job.
Each unique job can have multiple skills
and each unique skill can have multiple jobs.
I want to create a table where "job" is a unique key
and each skill appears in a separate column. How do I do this?

Lukes Query Assist_bot:
To create a table where each unique job is a key
and each skill associated with that job appears in a separate column,
we can use a pivot operation. SQL does not have a direct pivot function,
but we can achieve this using conditional aggregation.

*/
-- I wanted a Table so I thought of adding this:
CREATE TABLE skills_to_job_top_9_dim AS
--Pivoting skills to append them to job_id
--  Step 1: Identify and rank the skills for each job
WITH RankedSkills AS (
    SELECT 
        sjd.job_id,
        sjd.skill_id,
        s.skills,
        ROW_NUMBER() OVER (PARTITION BY sjd.job_id ORDER BY sjd.skill_id) AS skill_rank
    FROM 
        skills_job_dim AS sjd
    JOIN 
        skills_dim AS s ON sjd.skill_id = s.skill_id
)

--  Step 2: Pivot the ranked skills into separate columns
SELECT 
    j.job_id,
    MAX(CASE WHEN rs.skill_rank = 1 THEN rs.skills END) AS skill_1,
    MAX(CASE WHEN rs.skill_rank = 2 THEN rs.skills END) AS skill_2,
    MAX(CASE WHEN rs.skill_rank = 3 THEN rs.skills END) AS skill_3,
    MAX(CASE WHEN rs.skill_rank = 4 THEN rs.skills END) AS skill_4,
    MAX(CASE WHEN rs.skill_rank = 5 THEN rs.skills END) AS skill_5,
    MAX(CASE WHEN rs.skill_rank = 6 THEN rs.skills END) AS skill_6,
    MAX(CASE WHEN rs.skill_rank = 7 THEN rs.skills END) AS skill_7,
    MAX(CASE WHEN rs.skill_rank = 8 THEN rs.skills END) AS skill_8,
    MAX(CASE WHEN rs.skill_rank = 9 THEN rs.skills END) AS skill_9

FROM 
    job_postings_fact AS j
LEFT JOIN 
    RankedSkills AS rs ON j.job_id = rs.job_id
GROUP BY 
    j.job_id, j.job_title_short
ORDER BY 
    j.job_id
