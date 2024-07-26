-- Create Tables from other tables

-- create three tables Jan 2023 Jobs, Feb 2023 Jobs, March 2023 Jobs
 CREATE TABLE january2023_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

-- and february
CREATE TABLE february2023_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 2;

-- and march
CREATE TABLE march2023_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 3;
