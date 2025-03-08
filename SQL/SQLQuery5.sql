USE DB_2025
GO
SELECT*
FROM campus_marketing

SELECT channel, SUM(spend_usd)
FROM campus_marketing
GROUP BY channel

SELECT SUM(spend_usd)
FROM campus_marketing

SELECT*
FROM campus_salesforce