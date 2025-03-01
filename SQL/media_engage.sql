
--Connect to Database 

USE DB_2025
GO

-- View "Enrolled" table

SELECT*
FROM Enrolled

--Engagement Profile - lead created, hear_about_campus, utm_marketing_channel, application_state_date...

--Channels of awareness

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
  CAST(cb.total AS FLOAT) / tc.grand_total * 100 AS percentage

FROM channel_breakdown cb
CROSS JOIN total_count tc
ORDER BY cb.total DESC