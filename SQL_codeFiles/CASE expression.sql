-- CASE expression
-- are not unlike If Conditions in coding bc of conditional logic being applied

-- CASE begins the expression
-- WHEN specifies the condition
-- THEN what if TRUE
-- ELSE (optional) output if no WHEN condition is met
-- END concludes CASE (these can be aliases too (like AS), so we can also create stuff)

SELECT
COUNT(job_id) AS number_of_jobs,
    --job_title_short,
    --job_location,
-- these provide all the cities, mere countries, "anywhere" asf.
-- if we wanted to look for either  local jobs or remote jobs and exclude other locations?
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE 'Berlin%' THEN 'Local'
        ELSE 'Elsewhere'
    END AS location_category

FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;
