INSERT INTO job_applied
        (job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status )
VALUES(1,
'2024-06-20',
true,
'CV_MarcRichter_HawarHelp.pdf',
true,
'Anschreiben_MarcRichter_HawarHelp.pdf',
'submitted'),
(2,
'2024-05-30',
true,
'CV_MarcRichter_lovebetter.pdf',
true,
'Anschreiben_MarcRichter_lovebetter.pdf',
'rejected'),
(3,
'2024-05-15',
true,
'CV_MarcRichter_DRFZ.pdf',
true,
'Anschreiben_MarcRichter_DRFZ.pdf',
'submitted');

SELECT *
FROM job_applied;