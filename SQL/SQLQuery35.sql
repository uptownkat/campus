USE DB_2025
GO


 --- Calculate GPA - different segments.

SELECT 
    first_gen_college,
    COUNT(*) AS total_students,
    SUM(CASE WHEN GPA_EFT BETWEEN 3.0 AND 4.0 THEN 1 ELSE 0 END) AS gpa_3_to_4,
    ROUND(100.0 * SUM(CASE WHEN GPA_EFT BETWEEN 3.0 AND 4.0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_gpa_3_to_4
FROM enrolled
GROUP BY first_gen_college
ORDER BY gpa_3_to_4 DESC;


-- list of dates and counts 



SELECT application_submit_date, COUNT(*) AS total_applicants
FROM salesforce_campus
WHERE utm_marketing_channel = 'google'
  AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
GROUP BY applic;


SELECT*
FROM social_media

