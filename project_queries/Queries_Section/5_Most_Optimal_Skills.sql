/*
identify what is in high demand and ahigh paying skill
    (check also my own version of Query number 4_  for this)
    let's focus on remote positions with specified salaries (not Null)
    !!! THIS EXAMPLE HAS SLIGHTLY DIFFERENT AVERAGE SALARIES COMPARED
    WITH OTHER QUERIES FOR THE SAME ITEMS, INVESTIGATE?
*/

-- our friend Luke uses a CTE inside of which he basically
-- pastes Query 3_ )

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT (jp_fact.job_id) AS n_o_jobs
    FROM job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim AS sj_dim ON jp_fact.job_id = sj_dim.job_id
    INNER JOIN skills_dim   ON sj_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),
--then he suggests we use a dumbed down version of Query 4_
-- also within a CTE 
-- which I took to writing out like so:
---WITH average_salary_table AS ( -but that is wrong since we group WITH statements
--and for this is the comma in Line 22)
average_salary_table AS(
    SELECT
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary,
        skills_dim.skill_id
    FROM job_postings_fact AS jp_fact
    INNER JOIN skills_job_dim AS sj_dim ON jp_fact.job_id = sj_dim.job_id
    INNER JOIN skills_dim ON sj_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short ='Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
)
SELECT skills_demand.skill_id,
    skills_demand.skills,
    n_o_jobs,
    avg_salary
FROM skills_demand 
INNER JOIN average_salary_table ON skills_demand.skill_id = average_salary_table.skill_id
WHERE n_o_jobs > 9
GROUP BY skills_demand.skill_id, skills_demand.skills, n_o_jobs, avg_salary
ORDER BY n_o_jobs DESC, avg_salary DESC