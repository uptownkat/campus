
-- Connect to Database 

USE DB_2025
GO


--View 'enrolled' table 

SELECT *
FROM enrolled

--Demographic Profile : gender, age, race, education, city/state, zip, veteran status


--Total enrolled Students =  911

SELECT COUNT(*) as total_enrolled
FROM enrolled

SQL/query_total enrolled.png
	
--Breakdown gender

SELECT 
	(SELECT COUNT(*) FROM enrolled WHERE gender = 'male') AS total_male,
	(SELECT COUNT(*) FROM enrolled WHERE gender = 'female') AS total_female

--- age , median age

SELECT age, COUNT(*) AS total_num
FROM enrolled
GROUP BY age
ORDER BY total_num DESC

SELECT AVG(age) as avg_age
from enrolled
WHERE age iS NOT NULL

SELECT MIN(age)AS youngest_age, MAX(age) AS oldest_age
FROM Enrolled

--Race breakdown, including hispanic

SELECT race, COUNT(*) AS total_students, SUM(hispanic) AS total_hispanic
FROM enrolled
GROUP BY race
ORDER BY total_students DESC

--  Change datatypes of hispanic, high_school grad, ged,past college to int.

ALTER TABLE enrolled
ADD hispanic int
 
ALTER TABLE enrolled
ALTER COLUMN high_school_grad int

ALTER TABLE enrolled
ALTER COLUMN ged_received int

ALTER TABLE enrolled
ALTER COLUMN past_college_enrollment int 

--Confirm datatype as int.

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'enrolled';


--Calculate the % Hispanics  =  17.56% 

SELECT 
    ROUND(SUM(hispanic) * 100.0 / COUNT(*),2) AS hispanic_percentage
FROM enrolled

--Education Profile: % high_schoo_grad, rec'd GED, first_gen_college, past_enrollment

SELECT SUM(high_school_grad) as total_HS_grad, SUM(ged_received) AS total_GED, SUM(past_college_enrollment) as past_college_enrollment
FROM enrolled


-- Calculate % of all enrolled  

SELECT SUM(high_school_grad)*100/count(*) AS perc_HS_grad, SUM(ged_received)*100/count(*) AS perc_GED_recieved, SUM(past_college_enrollment)*100/count(*) as perc_past_college_enroll
FROM enrolled;

--Geographic Profile

--States, student count

SELECT State, COUNT(*) as total_students
FROM enrolled
GROUP BY state
ORDER BY total_students DESC

--Number of States

SELECT COUNT(DISTINCT STATE) AS total_states
FROM enrolled

--Cities and # of students living there.


SELECT City, COUNT(*) as total_students
FROM enrolled
GROUP BY city
order BY total_students DESC


--Total Cities

SELECT COUNT(DISTINCT City) as total_cities
FROM ENrolled

--Veteran profile

SELECT Veteran_Status, COUNT(Veteran_status)  as total_students
FROM enrolled
GROUP BY veteran_status

--Percentage veterans  

SELECT 
	COUNT(veteran_status)*100/
	(SELECT COUNT(*) FROM enrolled) AS perc_veteran
FROM enrolled
WHERE veteran_status = 'veteran'
