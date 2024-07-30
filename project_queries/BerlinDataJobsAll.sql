SELECT --jp_fact.job_id,
        --job_title_short,
        --ROUND(salary_year_avg, 0) AS salary_ann,
        DISTINCT jp_fact.job_id,
        company_dim.name AS company,
        link,
        COUNT (jp_fact.job_id) AS n_o_jobs,
        job_title AS descriptive_title,
        skills_dim.skills AS skills

    FROM job_postings_fact AS jp_fact
    INNER JOIN company_dim ON jp_fact.company_id = company_dim.company_id
    INNER JOIN skills_job_dim AS sjdim ON jp_fact.job_id = sjdim.job_id
    INNER JOIN skills_dim ON sjdim.skill_id = skills_dim.skill_id
    WHERE job_location LIKE 'Berlin%' AND skills LIKE '%unity%'
    GROUP BY jp_fact.job_id, company_dim.name, link, jp_fact.job_title, skills