/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by theirr demand in remote jobs
- (skill id, name, n_o_postings requiring the skill)
*/


WITH remote_job_skills AS
(
-- Wrote the inner statement first first until it would show the skill_id and
-- with it the number of postings per skill succesfully
    SELECT skill_id,
        COUNT (*) AS skill_count

    FROM skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    -- inner join gets us the results we want as we wanna know the count of the applicable jobs that actually exist
    -- and we have no need to count anything else
    WHERE job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
    GROUP BY skill_id
    )
SELECT skill.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skill ON skill.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 12