-- DATE / TIME
-- we can cast date strings to be dates using ::DATE 
-- as a command,
-- now, in the database the dates are timestamps and look okay, if we query the dataset
-- SELECT job_title_short AS JOb,
-- job_posted_date AS date
-- FROM job_postings_fact;
 -- we do in fact see the timestamp 2023-06-04 17:27:58 in the results
SELECT job_title_short AS Job,
EXTRACT (MONTH FROM job_posted_date) AS col_month,
-- this extract func usually in "SELECT" gets a field (YY or MM or DD) from a date/time value
job_posted_date :: DATE AS date,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
 FROM job_postings_fact
 LIMIT  9;
 -- so when casting the date as DATE we get only the date info
 -- we can use the time zone with AT TIME ZONE
 -- with or without preexisting timezone information
 -- with: YYYY-MM-DD HH:MI:SC +HH:MM
 -- the names for timezones are in postgres documentation
 -- and the first argument states the timezone in the dataset
 -- while the second states the timezone we want to adjust to