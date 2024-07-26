/* Union

Combine result sets of two or more SELECT statements into a single result set.
    
    UNION       Removes duplicate rows
    UNION ALL   Includes duplicate rows

   !! Each SELECT statement within the UNION must have
    the same number of columns in the result sets with similar data types !!


Syntx: SELECT column_name
    FROM table_one

    UNION -- combining two tables

    SELECT column_name
    FROM table_two
*/
-- remember the jan-, feb-, march job tables we created earlier ("Create Tables from other tables")
SELECT job_location,
    company_id,
    job_title_short
FROM january2023_jobs

UNION

SELECT --make sure the columns are the same
    job_location,
    company_id,
    job_title_short
FROM february2023_jobs

UNION
SELECT job_location,
    company_id,
    job_title_short
FROM march2023_jobs