
--Connect to Database 

USE DB_2025
GO

-- View "Enrolled" table

SELECT*
FROM Enrolled

--Engagement Profile - lead created, hear_about_campus, utm_marketing_channel, application_state_date...

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
