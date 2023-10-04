-- 1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
from data_analyst_jobs
-- 1793
-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company
from data_analyst_jobs
LIMIT 10;
-- ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT (*)
from data_analyst_jobs 
WHERE location = 'TN';
-- 21 listings for Tennessee
SELECT COUNT (*)
from data_analyst_jobs
WHERE location = 'KY';
-- 6 listings for Kentucky 

-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT title
from data_analyst_jobs
WHERE location = 'TN' and star_rating > 4;
-- 3 job postings 

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT (*)
from data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
-- 151 postings
-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS average_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY average_rating DESC;
-- State with the highest AVG rating : Nebraska 
-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs
-- 881 Unique Job Titles 
-- 8.	How many unique job titles are there for California companies?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE location = 'CA';
-- 230 Unique Job titles for CA companies
-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(*) AS company, COUNT(*) AS star_rating  
FROM data_analyst_jobs
WHERE review_count > 5000;
-- 185 companies with review count > 5000
-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT COUNT(*) AS company, COUNT(*) AS star_rating  
FROM data_analyst_jobs
WHERE review_count > 5000
ORDER BY star_rating DESC;
-- 11.	Find all the job titles that contain the word â€˜Analystâ€™. How many different job titles are there? 

-- 12.	How many different job titles do not contain either the word â€˜Analystâ€™ or the word â€˜Analyticsâ€™? What word do these positions have in common?

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
