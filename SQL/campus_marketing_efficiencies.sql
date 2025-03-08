USE DB_2025
GO



SELECT COUNT(*)
FROM enrolled

SELECT COUNT(*)
FROM enrolled
WHERE date_qtr_start iS NOT NULL


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



-- find average GPA for enrolled students

SELECT AVG(GPA_EFT)  as average_GPA
FROM enrolled 
 
 




-- # of students above average and below

SELECT COUNT(*) as num_above_avg_GPA


