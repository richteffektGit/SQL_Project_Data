--practice Union/ Union all
-- get the corresponding skill and skill type for each job posting in Q1
-- including those w/ no skills
-- look at skills and skill type for each job in Q1 with a salary greater than 70K

SELECT quarter_1_job_postings.job_title_short,
    quarter_1_job_postings.job_location,
    quarter_1_job_postings.job_via,
    quarter_1_job_postings.job_posted_date::date,
    quarter_1_job_postings.salary_year_avg
FROM
    (
    SELECT *
    FROM january2023_jobs

    UNION ALL

    SELECT *
    FROM february2023_jobs

    UNION ALL

    SELECT *
    FROM march2023_jobs
    ) AS quarter_1_job_postings

WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC