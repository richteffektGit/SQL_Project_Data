--practice Union/ Union all
-- get the corresponding skill and skill type for each job posting in Q1
-- including those w/ no skills
-- look at skills and skill type for each job in Q1 with a salary greater than 70K
-- this is pretty bad (no UNION func) and does not get it;
-- see Luke's practice round for a better execution

SELECT col_month,
job_no,
job_title_short,
salary_year_avg,
skill_type,
skill
FROM   (
    SELECT EXTRACT (MONTH FROM job_posted_date) AS col_month,
        job_postings_fact.job_id AS job_no,
        job_title_short,
        salary_year_avg,
        skills_dim.type AS skill_type,
        skills_dim.skills AS skill
        FROM job_postings_fact

        LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 )
WHERE col_month BETWEEN 1 AND 3
    AND (salary_year_avg IS NOT NULL) AND (salary_year_avg > 70000)
    AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
