-- count job postings per company and based on that determine which size they have

SELECT
    n_o_postings,
    id,
    company,
    CASE 
    WHEN n_o_postings < 10 THEN 'Small'
    WHEN n_o_postings BETWEEN 11 AND 50 THEN 'Medium'
    WHEN n_o_postings > 50 THEN 'Big'
    ELSE 'Weird'
    END AS company_size_buckets
FROM (SELECT COUNT (job_id) AS n_o_postings,
    job_postings_fact.company_id AS id,
    company_dim.name AS company
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    GROUP BY job_postings_fact.company_id, company_dim.name
    ORDER BY n_o_postings DESC)