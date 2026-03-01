CREATE DATABASE AI_Job_Impact;
GO

USE AI_Job_Impact 
GO

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    posting_year INT,
    country VARCHAR(100),
    region VARCHAR(100),
    city VARCHAR(100),
    company_name VARCHAR(200),
    company_size VARCHAR(50),
    industry VARCHAR(150),
    job_title VARCHAR(200),
    seniority_level VARCHAR(50),
    ai_mentioned BIT,
    ai_keywords VARCHAR(MAX),
    ai_intensity_score FLOAT,
    core_skills VARCHAR(MAX),
    ai_skills VARCHAR(MAX),
    salary_usd FLOAT,
    salary_change_vs_prev_year_percent FLOAT,
    automation_risk_score FLOAT,
    reskilling_required BIT,
    ai_job_displacement_risk FLOAT,
    job_description_embedding_cluster INT,
    industry_ai_adoption_stage VARCHAR(100)
);  


SELECT COUNT(*) FROM Jobs;

SELECT @@SERVERNAME;

DROP TABLE Jobs;

CREATE TABLE Jobs (
    job_id VARCHAR(100) PRIMARY KEY,
    posting_year INT,
    country VARCHAR(100),
    region VARCHAR(100),
    city VARCHAR(100),
    company_name VARCHAR(200),
    company_size VARCHAR(50),
    industry VARCHAR(150),
    job_title VARCHAR(200),
    seniority_level VARCHAR(50),
    ai_mentioned BIT,
    ai_keywords VARCHAR(MAX),
    ai_intensity_score FLOAT,
    core_skills VARCHAR(MAX),
    ai_skills VARCHAR(MAX),
    salary_usd FLOAT,
    salary_change_vs_prev_year_percent FLOAT,
    automation_risk_score FLOAT,
    reskilling_required BIT,
    ai_job_displacement_risk FLOAT,
    job_description_embedding_cluster INT,
    industry_ai_adoption_stage VARCHAR(100)
);

USE AI_Job_Impact;
SELECT COUNT(*) FROM Jobs;

SELECT DB_NAME();

SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Jobs';



ALTER TABLE Jobs
ALTER COLUMN ai_job_displacement_risk VARCHAR(50);    


----------- Data Validation 

SELECT count(DISTINCT job_id)  FROM Jobs;

SELECT MIN(posting_year), MAX(posting_year) FROM Jobs;

SELECT TOP 10 * FROM Jobs;


--- Insight: Is AI hiring increasing yearly?
----- AI Job Trend Over Years -----

SELECT posting_year, COUNT(*) AS total_jobs
FROM Jobs
GROUP BY posting_year
ORDER BY posting_year;

--- Insight: How many jobs require AI skills?
----- AI Mentioned vs Not Mentioned -----

SELECT ai_mentioned, COUNT(*) AS job_count
FROM Jobs
GROUP BY ai_mentioned;

--- Insight: Which countries lead AI hiring?
----- Top Countries Hiring AI Talent -----

SELECT TOP 10 country, COUNT(*) AS total_jobs
FROM Jobs
GROUP BY country
ORDER BY total_jobs DESC;

--- Insight: Which industries pay highest?
----- Average Salary by Industry -----

SELECT industry, AVG(salary_usd) AS avg_salary
FROM Jobs
GROUP BY industry
ORDER BY avg_salary DESC;

--- Automation Risk Distribution

SELECT automation_risk_score, COUNT(*) AS total_jobs
FROM Jobs
GROUP BY automation_risk_score
ORDER BY total_jobs DESC;

--- Insight: Does higher AI intensity mean higher salary?
----- AI Intensity vs Salary -----
SELECT 
    CASE 
        WHEN ai_intensity_score < 0.3 THEN 'Low AI'
        WHEN ai_intensity_score < 0.7 THEN 'Medium AI'
        ELSE 'High AI'
    END AS AI_Level,
    AVG(salary_usd) AS avg_salary
FROM Jobs
GROUP BY 
    CASE 
        WHEN ai_intensity_score < 0.3 THEN 'Low AI'
        WHEN ai_intensity_score < 0.7 THEN 'Medium AI'
        ELSE 'High AI'
    END;

--- Create a View


