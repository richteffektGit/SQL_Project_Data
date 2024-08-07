/*let's now identify a top paying skill (incl. learn what makes a skill top-pay)
    so an average salary associated with a skill
    again, for D.A: roles and w/ no Nulls obv.
*/

WITH d_a_skills AS
    (
    SELECT jp_fact.job_id,
        job_title,
        skills_dim.skills AS skills_to_job,
        salary_year_avg
    FROM job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim ON jp_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short ='Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND --(job_location LIKE 'Berlin%' OR 
            job_location = 'Anywhere'--)
    GROUP BY job_title, skills_to_job,jp_fact.job_id
    )
SELECT ROUND(AVG (salary_year_avg),0) AS salary_per_skill,
    skills_to_job,
    CASE WHEN COUNT (skills_to_job) BETWEEN 9 AND 20 THEN  'C_overall_requested'
        WHEN COUNT (skills_to_job) BETWEEN 21 AND 60 THEN  'B_well_requested'
        WHEN COUNT (skills_to_job) > 61 THEN 'A_super_requested'
    ELSE 'Other'
    END AS frequent_skills
FROM d_a_skills

GROUP BY d_a_skills.skills_to_job
ORDER BY salary_per_skill DESC