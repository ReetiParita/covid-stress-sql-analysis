CREATE DATABASE covid19_project;
USE covid19_project;

CREATE TABLE database_covid (
  Stress_Level VARCHAR(20),
  Sector VARCHAR(100),
  Increased_Work_Hours INT,
  Work_From_Home INT,
  Productivity_Change INT,
  Health_Issue INT,
  Job_Security INT,
  Childcare_Responsibilities INT,
  Commuting_Changes INT,
  Technology_Adaptation INT,
  Salary_Changes INT,
  Team_Collaboration_Challenges INT,
  Affected_by_Covid INT,
  Hours_Worked_Per_Day FLOAT,
  Meetings_Per_Day FLOAT
);

SELECT * FROM database_covid LIMIT 10;

# Which sector reported the highest number of people affected by COVID-19?
SELECT Sector, COUNT(*) AS affected_count
FROM Database_Covid
WHERE Affected_by_Covid = 1
GROUP BY Sector
ORDER BY affected_count DESC;



#How many employees fall under each stress level?
SELECT Stress_Level, COUNT(*) AS Employee_Count
FROM Database_Covid
GROUP BY Stress_Level;



#What is the average stress level per sector?
SELECT Sector, 
       COUNT(CASE WHEN Stress_Level = 'High' THEN 1 END) AS High_Stress,
       COUNT(CASE WHEN Stress_Level = 'Medium' THEN 1 END) AS Medium_Stress,
       COUNT(CASE WHEN Stress_Level = 'Low' THEN 1 END) AS Low_Stress
FROM Database_Covid
GROUP BY Sector;



#What is the average hours worked per day by stress level?
SELECT Stress_Level, AVG(Hours_Worked_Per_Day) AS Avg_Hours
FROM Database_Covid
GROUP BY Stress_Level;



#Which sector had the highest average number of meetings per day?
SELECT Sector, AVG(Meetings_Per_Day) AS Avg_Meetings
FROM Database_Covid
GROUP BY Sector
ORDER BY Avg_Meetings DESC
LIMIT 1;



#Is working from home linked with increased work hours?
SELECT Work_From_Home, 
       AVG(Increased_Work_Hours) AS Avg_Increased_Hours
FROM Database_Covid
GROUP BY Work_From_Home;



#Which sector had the most employees facing job insecurity?
SELECT Sector, COUNT(*) AS Job_Insecure_Count
FROM Database_Covid
WHERE Job_Security = 1
GROUP BY Sector
ORDER BY Job_Insecure_Count DESC;



#What percentage of people experienced a decrease in productivity?
SELECT 
  (COUNT(*) - SUM(Productivity_Change)) * 100.0 / COUNT(*) AS Decrease_Percentage
FROM Database_Covid;



#How many people faced both childcare responsibilities and health issues?
SELECT COUNT(*) AS Count_With_Both
FROM Database_Covid
WHERE Childcare_Responsibilities = 1 AND Health_Issue = 1;


#Does stress level correlate with salary changes?
SELECT Stress_Level, 
       COUNT(CASE WHEN Salary_Changes = 1 THEN 1 END) AS Salary_Changed
FROM Database_Covid
GROUP BY Stress_Level;



#Top 3 sectors where team collaboration challenges were highest
SELECT Sector, COUNT(*) AS Collaboration_Issues
FROM Database_Covid
WHERE Team_Collaboration_Challenges = 1
GROUP BY Sector
ORDER BY Collaboration_Issues DESC
LIMIT 3;



#Which sector adapted to technology the most?
SELECT Sector, AVG(Technology_Adaptation) AS Tech_Adaptation_Rate
FROM Database_Covid
GROUP BY Sector
ORDER BY Tech_Adaptation_Rate DESC;



#How many respondents worked from home and were still affected by COVID?
SELECT COUNT(*) AS WFH_Affected
FROM Database_Covid
WHERE Work_From_Home = 1 AND Affected_by_Covid = 1;


#Which sectors were most affected by COVID?
SELECT Sector, COUNT(*) AS Affected_Count
FROM Database_Covid
WHERE Affected_by_Covid = 1
GROUP BY Sector
ORDER BY Affected_Count DESC;


#What is the average number of meetings per day for employees working from home?
SELECT AVG(Meetings_Per_Day) AS Avg_Meetings_WFH
FROM Database_Covid
WHERE Work_From_Home = 1;


#What is the average productivity change by stress level?
SELECT Stress_Level, AVG(Productivity_Change) AS Avg_Productivity
FROM Database_Covid
GROUP BY Stress_Level;


#What is the relationship between technology adaptation and productivity change?
SELECT Technology_Adaptation, AVG(Productivity_Change) AS Avg_Productivity
FROM Database_Covid
GROUP BY Technology_Adaptation;



#Which factor is most common among people with high stress?
SELECT 'Health_Issue' AS Factor, COUNT(*) AS Count FROM Database_Covid WHERE Stress_Level = 'High' AND Health_Issue = 1
UNION ALL
SELECT 'Job_Security', COUNT(*) FROM Database_Covid WHERE Stress_Level = 'High' AND Job_Security = 1
UNION ALL
SELECT 'Childcare_Responsibilities', COUNT(*) FROM Database_Covid WHERE Stress_Level = 'High' AND Childcare_Responsibilities = 1
UNION ALL
SELECT 'Team_Collaboration_Challenges', COUNT(*) FROM Database_Covid WHERE Stress_Level = 'High' AND Team_Collaboration_Challenges = 1;











