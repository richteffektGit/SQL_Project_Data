-- Subqueries Exercise
-- find company names (in dim.-Table) to jobs with no qual. required)

SELECT name AS company
FROM company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
)