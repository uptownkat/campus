SELECT*
FROM enrolled

--Behaviorial Profile of enrolled users during Application Process

---profile those that:

--were prev iously enrolled? 

SELECT was_previous_enrollment, COUNT(was_previous_enrollment) AS total
FROM enrolled
GROUP BY was_previous_enrollment

-- percentage passed exam  

SELECT assessment_decision, COUNT(*) as total
FROM enrolled
GROUP BY assessment_decision

--view the 5 students who "failed" , "not taken"

SELECT *
FROM enrolled
WHERE assessment_decision ='failed'

SELECT *
FROM enrolled
WHERE assessment_decision ='not taken'


--- how many received

SELECT offer_letter_status, COUNT(offer_letter_status) as total
FROM enrolled
GROUP BY offer_letter_status


---assessment # taken


SELECT assessment_attempts, COUNT(assessment_attempts) as total
FROM enrolled
GROUP BY assessment_attempts



--Time between starting application - submission date -- conversation date to interview, async interview ate admit date. received an offer letter


--avg days from lead creation to starting application . --what is the average, range?  also count of students [ create funnel in PBI}

SELECT DATEDIFF(DAY, lead_created_date, application_start_date) AS num_days
FROM enrolled

-- what is min and max days

SELECT MIN(datediff(day, lead_created_date, application_start_date))as Least_num, MAX(DATEDIFF(DAY, lead_created_date, application_start_date))as Max_num
FROM enrolled

-- how many started application at when lead created

SELECT COUNT(*)as total_applicants
FROM Enrolled
WHERE lead_created_date = application_start_date

