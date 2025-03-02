USE DB_2025
GO

-- Total Enrolled Students

SELECT COUNT(*) AS total_enrolled
FROM enrolled

-- View enroll dates

SELECT enroll_date
FROM enrolled

-- View earliest and latest date of enrollment

SELECT MAX(enroll_date) AS earliest_date, MIN (enroll_date) AS latest_date
FROM enrolled


SELECT DISTINCT YEAR(enroll_date) AS Year, COUNT(*) AS total_students
FROM enrolled
GROUP BY Year(enroll_date)

 