-- Create job_applied table
-- when creating or manipulating tables there are 4 things we can do
-- CREATE TABLE
-- ALTER TABLE
--      ADD to add colmuns
--      RENAME COLUMN
--      ALTER COLUMN to change a columns datatype
--      DROP COLUMN to delete the column 
-- INSERT INTO to add columns to table(s) 
-- DROP TABLE to delete it 

CREATE TABLE job_applied ( 
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(99),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR (99),
    status VARCHAR(50)
);