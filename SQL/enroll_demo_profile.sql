
-- Connect to Database 

USE DB_2025
GO


-- View 'enrolled' table 

SELECT *
FROM enrolled


-- Demographic Profile : gender, age, race, education, city/state, zip, veteran status


--Total enrolled Students =  911

SELECT COUNT(*) as total_enrolled
FROM enrolled


-- Gender breakdown

SELECT 
	(SELECT COUNT(*) FROM enrolled WHERE gender = 'male') AS total_male,
	(SELECT COUNT(*) FROM enrolled WHERE gender = 'female') AS total_female


-- Calculate % breakdown of gender

SELECT 
    COUNT(CASE WHEN gender = 'male' THEN 1 ELSE NULL END) AS total_male,
    COUNT(CASE WHEN gender = 'female' THEN 1 ELSE NULL END) AS total_female,
    ROUND(100.0 * COUNT(CASE WHEN gender = 'male' THEN 1 ELSE NULL END) / COUNT(*), 2) AS percent_male,
    ROUND(100.0 * COUNT(CASE WHEN gender = 'female' THEN 1 ELSE NULL END) / COUNT(*), 2) AS percent_female
FROM enrolled




-- View student ages

SELECT age, COUNT(*) AS total_num
FROM enrolled
GROUP BY age
ORDER BY total_num DESC

--- Calculate median age


SELECT AVG(age) as avg_age
FROM enrolled
WHERE age iS NOT NULL


-- View range of ages

SELECT MIN(age)AS youngest_age, MAX(age) AS oldest_age
FROM Enrolled

-- Create age groups

SELECT 
    age,
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS age_group
FROM enrolled;

--- Calculate count for each group

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END AS age_group, COUNT(*) AS student_count
FROM enrolled
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+' 
    END
ORDER BY age_group

-- Calculate % breakdown for each age group


WITH Age_Breaks AS (
    SELECT 
        CASE 
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+' 
        END AS age_group, COUNT(*) AS student_count
    FROM enrolled

    GROUP BY 
        CASE 
            WHEN age BETWEEN 18 AND 24 THEN '18-24'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+' 
        END
)

SELECT age_group, student_count, ROUND(100.0 * student_count / SUM(student_count) OVER (), 2) AS percent_of_total
FROM Age_Breaks
ORDER BY age_group;

-- Race breakdown

SELECT race, COUNT(*) AS total
FROM enrolled
GROUP BY race
ORDER BY total DESC



-- Correct spelling , fix format

UPDATE enrolled
SET race = REPLACE(race, 'americanIndian', 'American Indian')

UPDATE enrolled
SET race = REPLACE(race, 'nativeHawaiian', 'Native Hawaiian')

-- Capitalize each value

UPDATE enrolled 
SET race = UPPER(LEFT(race,1))+ LOWER(SUBSTRING(race,2,LEN(race)))

-- Change datatypes of hispanic, high_school grad, ged, past college to int.

ALTER TABLE enrolled
ADD hispanic INT
 
ALTER TABLE enrolled
ALTER COLUMN high_school_grad INT

ALTER TABLE enrolled
ALTER COLUMN ged_received INT

ALTER TABLE enrolled
ALTER COLUMN past_college_enrollment INT 

-- Confirm datatype as INT

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'enrolled';

-- Calculate sum of Hispanics

SELECT SUM(hispanic) AS total_hispanic
FROM enrolled

-- Calculate the % Hispanics   

SELECT ROUND(SUM(hispanic) * 100.0 / COUNT(*),2) AS hispanic_percentage
FROM enrolled

-- Race breakdown, including hispanic

SELECT race, COUNT(*) AS total_students, SUM(hispanic) AS total_hispanic
FROM enrolled
GROUP BY race
ORDER BY total_students DESC


--Calculate Hispanic w/other race

SELECT race, COUNT(race) AS total, SUM(hispanic) AS total_hispanic
FROM enrolled
GROUP BY race


-- Education Profile: % high_schoo_grad, rec'd GED, first_gen_college, past_enrollment

SELECT SUM(high_school_grad) as total_HS_grad, SUM(ged_received) AS total_GED, SUM(past_college_enrollment) as past_college_enrollment
FROM enrolled

-- Calculate % of all enrolled  

SELECT SUM(high_school_grad)*100/count(*) AS perc_HS_grad, SUM(ged_received)*100/count(*) AS perc_GED_recieved, SUM(past_college_enrollment)*100/count(*) as perc_past_college_enroll
FROM enrolled;

-- Geographic Profile - States, student count

SELECT State, COUNT(*) as total_students
FROM enrolled
GROUP BY state
ORDER BY total_students DESC

-- Number of States

SELECT COUNT(DISTINCT state) AS total_states
FROM enrolled
WHERE state <> 'unknown'

-- Cities and # of enrolled students living  


SELECT City, COUNT(*) as total_students
FROM enrolled
GROUP BY city
order BY total_students DESC


--Total Cities

SELECT COUNT(DISTINCT City) as total_cities
FROM ENrolled
WHERE city <>'unknown'


-- Determine region - import data 'state-region' csv. Join tables

SELECT*
FROM states_regions

 
 --Join 2 tables, query regions

 SELECT e.state, COUNT(e.state) AS total_students, s.Region, s.Division
 FROM enrolled e
 JOIN states_regions s
 ON e.state = s.State_Code
 GROUP BY e.state, s.Region, s.Division
 

--View count of states within each region with enrolled students. 

-- Create CTE 'US_region', then create a Subquery

WITH US_region AS(
	SELECT e.state, COUNT(e.state) AS total_state, s.Region, s.Division
	FROM enrolled e
	JOIN states_regions s
	ON e.state = s.State_Code
	GROUP BY e.state, s.Region, s.Division
)

SELECT DISTINCT region, COUNT(total_state) AS total_states
FROM US_region
GROUP BY Region
ORDER BY total_states DESC

-- View total students per region

SELECT s.region, COUNT(DISTINCT e.state) AS total_states, COUNT(e.person_id) AS total_students
FROM enrolled e
JOIN states_regions s
ON e.state = s.State_Code
GROUP BY s.region
ORDER BY total_students DESC;

-- Include # students as % of each region

WITH region_total AS (
    SELECT s.region, COUNT(DISTINCT e.state) AS total_states, COUNT(e.person_id) AS total_students
	FROM enrolled e
	JOIN states_regions s
	ON e.state = s.State_Code
	GROUP BY s.region
   
)
SELECT region, ROUND((total_students * 100.0) / SUM(total_students) OVER (), 2) AS percent_of_total
FROM region_total
 
--View total students per Division

WITH division_total AS (
    SELECT s.Division, COUNT(e.person_id) AS total_students
	FROM enrolled e
	JOIN states_regions s
	ON e.state = s.State_Code
	GROUP BY s.Division   
 )
SELECT s.Division, COUNT(e.person_id) AS total_students
FROM enrolled e
JOIN states_regions s
ON e.state = s.State_Code
GROUP BY s. Division
ORDER BY total_students DESC;


--View % of students by Division


WITH division_total AS (
    SELECT s.Division, COUNT(e.person_id) AS total_students
	FROM enrolled e
	JOIN states_regions s
	ON e.state = s.State_Code
	GROUP BY s.Division   
)
SELECT division, ROUND((total_students * 100.0) / SUM(total_students) OVER (), 2) AS percent_of_total
FROM division_total
ORDER BY percent_of_total DESC

-- Veteran profile

SELECT Veteran_Status, COUNT(Veteran_status)  as total_students
FROM enrolled
GROUP BY veteran_status

-- Percentage veterans  

SELECT COUNT(veteran_status)*100/(SELECT COUNT(*) FROM enrolled) AS perc_veteran
FROM enrolled
WHERE veteran_status = 'veteran'


--Household income-- socioeconomic level - use Fafsa application as indicator

SELECT COUNT(*) AS total_students_apply_FA
FROM enrolled
WHERE fafsa_status = 'completed'