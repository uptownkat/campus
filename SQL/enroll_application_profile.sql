USE DB_2025
GO

-- Total Enrolled Students

SELECT COUNT(*) AS total_enrolled
FROM enrolled

-- View enroll dates

SELECT enroll_date
FROM enrolled

-- View most recent and earliest date of enrollment

SELECT MAX(enroll_date) AS most_recent_date, MIN (enroll_date) AS earliest_date
FROM enrolled

-- View breakdown of month of enrollment

SELECT DATENAME(MONTH, enroll_date) AS enrollment_month, COUNT(*) AS total_students
FROM enrolled
WHERE YEAR(enroll_date) = 2024
GROUP BY DATENAME(MONTH, enroll_date)
ORDER BY Total_students DESC

SELECT DISTINCT YEAR(enroll_date) AS Year, COUNT(*) AS total_students
FROM enrolled
GROUP BY Year(enroll_date)

-- View date of START of application

SELECT application_start_date
FROM enrolled
 
SELECT DISTINCT year(application_start_date) as Year
FROM enrolled

SELECT MAX(application_start_date) AS most_recent_date, MIN (application_start_date) AS earliest_date
FROM enrolled


--Calculate the days from application start to application submit time period

SELECT DATEDIFF(DAY, application_start_date,  application_submit_date)
FROm enrolled

-- Calculate number of students who started and submitted application on same day

SELECT COUNT(*) as total__applied_submit_same_day
FROM enrolled
WHERE application_start_date = application_submit_date

--Calculate number of students who start and submit application on different days

SELECT COUNT(*) as applicants_diff_day_app
FROM enrolled
WHERE application_start_date <> application_submit_date

-- View calculations side by side

SELECT
	(SELECT COUNT(*) as total__applied_submit_same_day FROM enrolled WHERE application_start_date = application_submit_date) AS applied_submit_same_day, 
	(SELECT COUNT(*) as total__applied_submit_same_day FROM enrolled WHERE application_start_date <> application_submit_date) AS diff_day



-- Check calculation

	SELECT application_start_date, application_submit_date FROM enrolled

--- View months when students apply and submit same day

SELECT DISTINCT DATENAME(MONTH,application_start_date) AS applied_month, COUNT(application_start_date) as total_applicants
FROM enrolled
WHERE application_start_date = application_submit_date
GROUP BY DATENAME(MONTH,application_start_date)


--View # days to apply for other students

SELECT DISTINCT(DATEDIFF(DAY, application_start_date, application_submit_date)) as Days_complete_app, COUNT(*)AS total_students
FROM enrolled
WHERE application_start_date <> application_submit_date
GROUP BY DATEDIFF(DAY, application_start_date, application_submit_date)

-- calculate days from application submission date to admission_date

--first make sure students all enrolled

SELECT COUNT(enroll_ident_verif_status) AS total_count_verified
FROM enrolled
WHERE enroll_ident_verif_status = 'verified'

--one student not verified, investigate...

SELECT COUNT(*)
FROM enrolled

SELECT*
FROM enrolled
WHERE enroll_ident_verif_status <> 'verified'

SELECT DISTINCT(date_Qtr_start)
FROM enrolled


