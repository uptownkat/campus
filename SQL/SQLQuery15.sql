USE DB_2025
GO

SELECT *
FROM marketing

SELECT channel, SUM(spend_usd)
FROM marketing
GROUP BY channel

SELECT SUM(spend_usd)
FROM marketing
WHERE channel = 'facebook'
SELECT*
FROM salesforce_campus


--import to power bi--- application submit date -facebook

SELECT application_submit_date, COUNT(*) AS num_submitted
FROM salesforce_campus
WHERE application_submit_date IS NOT NULL 
  AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
  AND utm_marketing_channel = 'facebook'
GROUP BY application_submit_date;

USE DB_2025
GO
SELECT COUNT(*)
FROM Salesforce_campus
WHERE application_submit_date IS NOT NULL
SELECT enroll_date, COUNT(*) AS number
FROM salesforce_campus
WHERE enroll_date IS NOT NULL 
  AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
  AND utm_marketing_channel = 'google'
GROUP BY enroll_date;


SELECT enroll_date, COUNT(*) AS total_applicants
FROM salesforce_campus
WHERE utm_marketing_channel = 'google'
  AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
GROUP BY enroll_date;
--SELECT lead_created_date, COUNT(*) as num_leads
FROM salesforce_campus
GROUP BY lead_created_date
HAVING lead_created_date BETWEEN '2024-06-06' AND '2024-09-15'

SELECT COUNT(*) as num_leads
FROM salesforce_campus
WHERE lead_created_date BETWEEN '2024-06-15' AND '2024-09-15' AND enroll_date IS NOT NULL
AND hear_about_campus = 'google'


--leads created by facebook (survey AND utm)



--UTM response 'facebook'

SELECT COUNT(*) as total
FROM salesforce_campus
WHERE utm_marketing_channel = 'google' 
AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
AND enroll_date IS NOT NULL


--- Social media _-UTM

SELECT COUNT(*) as num 
FROM salesforce_campus
WHERE hear_about_campus = 'linkedin' 
AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
 
---Survey response 'Tiktok'

SELECT COUNT(*) as num_facebook
FROM salesforce_campus
WHERE utm_marketing_channel = 'facebook' 
AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
AND
---  UTM data 'tiktok'
 
SELECT COUNT(*) as n



SELECT lead_created_date, COUNT(*) as total_applicants
FROM salesforce_campus 
WHERE hear_about_campus = 'facebook'
AND lead_created_date BETWEEN '2024-06-15' AND '2024-09-15'
 

SELECT COUNT(*)
FROM salesforce_campus
WHERE lead_created_date




SELECT COUNT(*) as total_num
FROM salesforce_campus
WHERE hear_about_campus = 'snapchat' AND UTM_marketing_channel = 'snapchat'
AND lead_created_date BETWEEN '2024-06-06' AND '2024-09-15'


---Survey response 'snapchat'

SELECT COUNT(*) as total_num
FROM salesforce_campus
WHERE utm_marketing_channel = 'snapchat' 
AND lead_created_date BETWEEN '2024-06-06' AND '2024-09-15'

---  UTM data 'snapchat'
 
SELECT COUNT(*) as total_num
FROM salesforce_campus
WHERE utm_marketing_channel = 'snapchat' 
 

SELECT COUNT(*) 
FROM salesforce_campus
WHERE fafsa_status = 'need docs' 
 
 SELECT DISTINCT(admit_status)
 FROM salesforce_campus

 SELECT COUNT(*)
 FROM salesforce_campus
 WHERE admit_status <> 'Assessment + Interview'