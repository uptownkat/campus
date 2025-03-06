
--Connect to Database 

USE DB_2025
GO

-- View "Enrolled" table

SELECT*
FROM Enrolled

--Channels of awareness - breakdown with totals

SELECT hear_about_campus, COUNT(*) as total
FROM enrolled
GROUP BY hear_about_campus
ORDER BY total DESC

---Calculate % of students for each channel - create 2 CTE's to calculate the %

WITH channel_breakdown AS (
  SELECT hear_about_campus, COUNT(*) as total
  FROM enrolled
  GROUP BY hear_about_campus
),

total_count AS (
  SELECT SUM(total) as grand_total
  FROM channel_breakdown
)

--Calculate % dividing both CTE's, use CAST to divide as FLOAT 


USE DB_2025
GO

SELECT*
fROM enrolled

--utm marketing channel - breakdown totals

SELECT utm_marketing_channel, count(*) as total
FROM enrolled
GROUP BY utm_marketing_channel
ORDER BY total DESC;


-- Calculate % - create 2 CTEs, then divide

 WITH utm_breakdown AS (
    SELECT utm_marketing_channel, COUNT(*) AS total
    FROM enrolled
    GROUP BY utm_marketing_channel
	
	SELECT COUNT(*) as applicants_diff_day_app
FROM enrolled
WHERE application_start_date <> application_submit_dateng_channel
),

all_utm AS (
    SELECT COUNT(*) AS grand_total
    FROM enrolled
)

SELECT 
    ub.utm_marketing_channel, 
    ub.total, 
    ROUND(CAST(ub.total AS FLOAT) / au.grand_total * 100, 2) AS percentage
FROM utm_breakdown ub
CROSS JOIN all_utm au
ORDER BY percentage DESC;


-- list of dates and counts 



SELECT enroll_date, COUNT(*) AS total_applicants
FROM salesforce_campus
WHERE utm_marketing_channel = 'google'
  AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
GROUP BY enroll_date;


SELECT*
FROM social_media

USE DB_2025
GO
SELECT first_gen_college, COUNT(*)
FROM enrolled
GROUP BY first_gen_college

-- remove 'unknown'  (897)


 --Channels of awareness - breakdown with totals

SELECT hear_about_campus, COUNT(*) as total
FROM enrolled
GROUP BY hear_about_campus
ORDER BY total DESC

--% of channel - create 2 CTE's to calculate the %

WITH channel_breakdown AS (
  SELECT hear_about_campus, COUNT(*) as total
  FROM enrolled
  GROUP BY hear_about_campus
),

total_count AS (
  SELECT SUM(total) as grand_total
  FROM channel_breakdown
)

--Calculate % dividing both CTE's, use CAST to divide as FLOAT 

SELECT 
  cb.hear_about_campus, 
  cb.total,
  ROUND(CAST(cb.total AS FLOAT)/ tc.grand_total*100,2) as per_utm
FROM channel_breakdown cb
CROSS JOIN total_count tc
ORDER BY cb.total DESC;



SELECT*
fROM enrolled

--utm marketing channel - breakdown totals

SELECT utm_marketing_channel, count(*) as total
FROM enrolled
GROUP BY utm_marketing_channel
ORDER BY total DESC;


-- Calculate % - create 2 CTEs, then divide

 WITH utm_breakdown AS (
    SELECT utm_marketing_channel, COUNT(*) AS total
    FROM enrolled
    GROUP BY utm_marketing_channel
),

all_utm AS (
    SELECT COUNT(*) AS grand_total
    FROM enrolled
)

SELECT 
    ub.utm_marketing_channel, 
    ub.total, 
    ROUND(CAST(ub.total AS FLOAT) / au.grand_total * 100, 2) AS per_utm
FROM utm_breakdown ub
CROSS JOIN all_utm au
ORDER BY per_utm DESC;

SELECT status_fafsa, COUNT(*)
FROM enrolled
GROUP BY status_fafsa

SELECT COUNT(date_lead_create)
FROM enrolled

USE DB_2025
GO

SELECT status_regist_EFT, COUNT(*)
FROM enrolled
GROUP BY status_regist_EFT
