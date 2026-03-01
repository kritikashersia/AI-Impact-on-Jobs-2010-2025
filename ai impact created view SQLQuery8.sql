
--- 1. CREATE A VIEW 
CREATE VIEW vw_AI_High_Paying_Jobs AS
SELECT *
FROM Jobs
WHERE salary_usd > 100000;