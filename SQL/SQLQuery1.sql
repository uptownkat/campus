USE DB_2025
GO
-- calculate count of students that submitted application

SELECT COUNT(*)
FROM salesforce_campus
WHERE application_submit_date IS NULL

--- only 14 did not submit an application-- confirm others submitted

SELECT COUNT(*) AS total_complete application
FROM salesforce_campus
WHERE application_submit_date IS NOT NULL

-- calculate percentage who submitted.

SELECT
	COUNT(CASE WHEN application_submit_date IS NOT NULL THEN 1 ELSE NULL END) * 100/COUNT(*) AS percentage_complete_app
	FROM salesforce_campus

SELECT COUNT(*) as total_not_complete_FS
FROM salesforce_campus

SELECT COUNT(*) as total_leads_created
FROM salesforce_campus
WHERE 


