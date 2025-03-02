USE DB_2025
GO

--View table = 12,009 records

SELECT*
FROM prospect


---View schema

SELECT* 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'prospect'

--- change datatypes of 'hispanic', 'high-school_grad', 'ged received' to INT 

ALTER TABLE prospect
ALTER COLUMN hispanic INT

ALTER TABLE prospect
ALTER COLUMN high_school_grad INT

ALTER TABLE prospect
ALTER COLUMN ged_received INT

ALTER TABLE prospect
ALTER COLUMN past_college_enrollment INT

--- Age breakdown

SELECT age, COUNT(*) AS total
FROM prospect
GROUP BY age

--youngest , oldest age.

SELECT MIN(age) AS youngest_age, MAX(age) AS oldest_age
FROM prospect

-- Average Age

SELECT AVG(age) AS average_age
FROM prospect

-- Gender Breakdown

SELECT 
	(SELECT COUNT(*) FROM prospect WHERE gender = 'female') AS total_female,
	(SELECT COUNT(*) FROM prospect WHERE gender = 'male') AS total_male,
	(SELECT COUNT(*) FROM prospect WHERE gender = 'non-binary')AS non_binary

---Race 

SELECT race, COUNT(*) AS total
FROM prospect
GROUP BY race
ORDER BY total DESC

-- hispanic

SELECT SUM(hispanic) AS total
FROM prospect

--breakdown of hispanic


SELECT 
    ROUND(SUM(hispanic) * 100.0 / COUNT(*),2) AS hispanic_percentage
FROM prospect


--Education Profile: % high_school_grad, rec'd GED, first_gen_college, past_enrollment

SELECT SUM(high_school_grad) as total_HS_grad, SUM(ged_received) AS total_GED, SUM(past_college_enrollment) as past_college_enrollment
FROM prospect

--Geographic Profile

--States, total count

SELECT State, COUNT(*) AS total_prospects
FROM prospect
GROUP BY state
ORDER BY total_prospects DESC

--Number of States

SELECT COUNT(DISTINCT STATE) AS total_states
FROM prospect

--Cities and # of prospects living there.


SELECT City, COUNT(*) as total
FROM prospect
GROUP BY city
order BY total DESC


--Total Cities

SELECT COUNT(DISTINCT City) as total_cities
FROM prospect

--Veteran profile

SELECT Veteran_Status, COUNT(Veteran_status)  as total
FROM prospect
GROUP BY veteran_status

--Percentage veterans  

SELECT 
	COUNT(veteran_status)*100/
	(SELECT COUNT(*) FROM prospect) AS perc_veteran
FROM prospect
WHERE veteran_status = 'veteran'