
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


-- Calculate how many of 'leads_create_date' same time as media campaign June 15-Sept 15-2024 

 
 SELECT COUNT(lead_created_date) as number_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'


 -- Calculate how many students started an application during media campaign

 SELECT COUNT(application_start_date) as number_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 
 
 -- Calculate how many students submitted an application during media campaign

 SELECT COUNT(application_submit_date) as number_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'

 --Calculate how many students enrolled during media campaign
 
 SELECT COUNT(enroll_date) as number_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'




 --Calculate how many of these leads where UTM = 'facebook'

  SELECT COUNT(lead_created_date) as number_of_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 AND utm_marketing_channel = 'facebook'
  

 --Calculate how many of these leads where UTM = 'snapchat'


 SELECT COUNT(lead_created_date) as number_of_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 AND utm_marketing_channel = 'snapchat'


 --Calculate how many of these leads where UTM = 'tiktok'


 SELECT COUNT(lead_created_date) as number_of_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 AND utm_marketing_channel = 'tiktok'

 --Calculate how many of these leads where UTM = 'google'


 SELECT COUNT(lead_created_date) as number_of_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 AND utm_marketing_channel = 'google'
 
 
 
 --Calculate how many of these leads where UTM = 'linkedin'

 SELECT COUNT(lead_created_date) as number_of_students
 FROM salesforce_campus
 WHERE lead_created_date BETWEEN '06-15-24' AND '09-15-24'
 AND utm_marketing_channel = 'linkedin'
 

 -- List all media channels

 SELECT DISTINCT(channel)
 FROM marketing

 
 -- Calculate total marketing budget (Facebook, Google, Linkedin, Other, Snapchat, Tiktok)

 SELECT SUM(spend_usd) AS total_budget
 FROM marketing

 --- Calculate total budget of Facebook

 SELECT SUM(spend_usd) AS total_budget_facebook
 FROM marketing
 WHERE channel = 'facebook'

 --- Calculate total budget of Snapchat

 SELECT SUM(spend_usd) AS total_budget_snapchat
 FROM marketing
 WHERE channel = 'snapchat'

 --- Calculate total budget of tiktok

 SELECT SUM(spend_usd) AS total_budget_tiktok
 FROM marketing
 WHERE channel = 'tiktok'

 --- Calculate total budget of Google

 SELECT SUM(spend_usd) AS total_budget_google
 FROM marketing
 WHERE channel = 'google'


--- Calculate total budget of linkedin

 SELECT SUM(spend_usd) AS total_budget_linkedin
 FROM marketing
 WHERE channel = 'linkedin'

 --- Calculate total budget of 'Other'

 SELECT SUM(spend_usd) AS total_budget_other
 FROM marketing
 WHERE channel = 'Other'


-- Calculate percentages of total budget for each media, facebook.
 
SELECT
	SUM(CASE WHEN channel = 'facebook' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_facebook
	FROM marketing


-- Calculate % budget of snapchat
 
SELECT
	SUM(CASE WHEN channel = 'snapchat' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_snapchat
	FROM marketing

-- Calculate % budget of tiktok
 
SELECT
	SUM(CASE WHEN channel = 'tiktok' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_tiktok
	FROM marketing


-- Calculate % budget of google
 
SELECT
	SUM(CASE WHEN channel = 'google' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_google
SELECT
	SUM(CASE WHEN channel = 'google' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_google
	FROM marketing

-- Calculate budget of linkedin

SELECT
	SUM(CASE WHEN channel = 'linkedin' THEN spend_usd ELSE 0 END) * 100/SUM(spend_usd) AS percentage_linkedin
	FROM marketing
