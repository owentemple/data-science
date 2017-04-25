-- You are chatting with an opinionated colleague of yours, and you ask her thoughts about your idea to revamp the bookmarks experience. She says that bookmarks aren't interesting and you should help her in her quest to improve support for having a large number of tabs. Your boss has asked you to put together a presentation recommending an area of focus for the next version of Firefox.
-- After considering the Data Analytics Workflow, you decide to look at a  recent test flight  with customer surveys and usage analytics to better inform your thinking. After that, you will decide which of the two areas to recommend.




--Describe the users represented in the data. Do you think they’re representative of the population of Firefox users?

SELECT q5, count(*) FROM survey GROUP BY q5;

-- Male 3719
-- Female 257
-- null 105


SELECT q6, count(*) FROM survey GROUP BY q6 order by q6;

-- 0   452
-- 1   1413
-- 2    1145
-- 3    543
-- 4    274
-- 5    210
-- 6    44

-- Looks like this might be a young group and skewed male, so it might not be representative. Tere are 3,719 males and only 257 females in the sample. Also, most users (1,413) are in the 18-25 age group, so perhaps this is a college campus we are seeing?





-- Describe any initial findings related to your research questions.


-- Describe what you still need to do for your presentation in order to make a sound recommendation.



-- ● Summarize the data in your presentation:
-- ○ Present your findings, results, and recommendations to the class.
-- ○ Review the Users table. Summarize the users represented in the survey.

SELECT * FROM users LIMIT 100;


SELECT count(*) from users;

--27,267 users



-- ○ Review the Survey table. How many of the total users completed the survey?

--4,081 of them answered survey questions


-- ○ Of users who completed the survey, identify the number of users who are new to
-- Firefox, as well as those who are longtime users.

SELECT q1, count(*), 100 * count(*)/(SELECT count(*) from survey) as pctoftotal from survey GROUP BY q1 order by q1;

--39% (1604) use Firefox more than 5 years
--30% (1226) used Firefox 3 to 5 years
--13% (549) used Firefox 2 to 3 years
--7% 322, 1 to 2 years
--2% 94, 6 months to a year
--1% 47, 3 to 6 months
--5% 215, less than 3 months


-- ○ Include other information that is important to your initial findings, and which may have affected your recommendation and final presentation.


-- ● Summarize your exploration of the bookmark-usage feature in your presentation. Some sample questions you could answer include:
-- ○ What’s the median number of bookmarks? What’s the average number?

SELECT distinct user_id, rtrim(data1,' total bookmarks') from events
WHERE event_code = 8
group by user_id, data1
order by user_id;


SELECT distinct user_id, CAST( rtrim(data1,' total bookmarks') as integer) as bookmarks from events
WHERE event_code = 8;



SELECT ROUND (AVG (CAST( rtrim(data1,' total bookmarks') as integer)),3) as bookmarks from events
WHERE event_code = 8;

--106.7 was the average number of bookmarks


SELECT ROUND (MAX (CAST( rtrim(data1,' total bookmarks') as integer)),0) as bookmarks from events
WHERE event_code = 8;

--19,883 was the max number of bookmarks

SELECT ROUND (MIN (CAST( rtrim(data1,' total bookmarks') as integer)),0) as bookmarks from events
WHERE event_code = 8;

--0 was the minimum number of bookmarks

SELECT ROUND (stddev_samp (CAST( rtrim(data1,' total bookmarks') as integer)),0) as bookmarks from events
WHERE event_code = 8;


--standard deviation of number of bookmarks is 416



SELECT ROUND (AVG (CAST( rtrim(events.data1,' total bookmarks') as integer)),3) as bookmarks from events
INNER JOIN survey on user_id
WHERE events.event_code = 8
GROUP BY survey.q1;





-- ○ What fraction of users launched at least one bookmark during the sample week?


SELECT count(distinct user_id) from events
WHERE event_code = 10


SELECT count(distinct user_id) from events



--6534 / 14,718    44.4% launched a bookmark




-- ○ What fraction of users created new bookmarks?

SELECT count(distinct user_id) FROM events
WHERE event_code = 9

--996 created a bookmark or a bookmark folder

SELECT count(distinct user_id) FROM events
WHERE event_code = 9 AND data1 = 'New Bookmark Added'

--988 created a new bookmark
--988  / 14,718    6.7% created a bookmark


-- ○ What's the distribution of how often bookmarks are used?

SELECT user_id, count(*) FROM events
WHERE event_code = 10
GROUP BY user_id
order by 2;
SELECT user_id, count(*) FROM events
WHERE event_code = 10
GROUP BY user_id
ORDER BY 2;

--broken apart by how long they used Firefox

SELECT survey.q1, count(*) FROM events
JOIN survey using(user_id)
WHERE events.event_code = 10
GROUP BY survey.q1
ORDER BY survey.q1;

-- ○ How does number of bookmarks correlate with how long the user has been using Firefox?

--to  calculate the number of bookmarks by time using Firefox

SELECT survey.q1, ROUND (AVG (CAST( rtrim(events.data1,' total bookmarks') as integer)),0) as bookmarks from events
JOIN survey using(user_id)
WHERE events.event_code = 8
GROUP BY survey.q1
ORDER BY survey.q1;

--the longer people have used Firefox the more book marks they have and the more they use them
--494 for less than 3 months
--120 for 3 to 6 months
--219 for 6 months to a year
--794 for 1 to 2 years
--1639 chooses for 2 to 3 years
--4,129 chooses for 3 to 5 years
--4,240 chooses for more than 5 years



-- ● Summarize your exploration of usage of browser tabs in the presentation. Some sample questions you could answer include:
-- ○ What's the distribution of the maximum number of tabs?

SELECT user_id, CAST( rtrim(data2,' tabs') as integer ) FROM events
WHERE event_code = 26
GROUP BY user_id, data2
order by 2;


SELECT MAX (CAST( rtrim(data2,' tabs') as integer )) FROM events
WHERE event_code = 26;
--Max is 1103

SELECT MIN(CAST( rtrim(data2,' tabs') as integer )) FROM events
WHERE event_code = 26;
--Min is 0

SELECT ROUND( AVG (CAST( rtrim(data2,' tabs') as integer )),2) FROM events
WHERE event_code = 26;
--Average is 6.68

SELECT ROUND( stddev_samp (CAST( rtrim(data2,' tabs') as integer )),2) FROM events
WHERE event_code = 26;
--standard deviation is 32.96



-- ○ Are there users who regularly have more than 10 tabs open?

SELECT distinct user_id, CAST( rtrim(data2,' tabs') as integer ) FROM events
WHERE event_code = 26
GROUP BY user_id, CAST( rtrim(data2,' tabs') as integer )
HAVING CAST( rtrim(data2,' tabs') as integer ) > 10
ORDER BY 2;

SELECT distinct user_id, CAST( rtrim(data2,' tabs') as integer ) FROM events
WHERE event_code = 26
GROUP BY user_id, CAST( rtrim(data2,' tabs') as integer )
ORDER BY 2;


--so 13.77% have more than 10 tabs open
--10,493 distinct users returned with more than 10 tabs open out of 76190 users in the study



-- ○ What fraction of user have ever had more than five tabs open?

SELECT distinct user_id, CAST( rtrim(data2,' tabs') as integer ) FROM events
WHERE event_code = 26
GROUP BY user_id, CAST( rtrim(data2,' tabs') as integer )
HAVING CAST( rtrim(data2,' tabs') as integer ) > 5
ORDER BY 2;

--22947 distinct users out of 76190 in the study

--What fraction of users have ever had more than 10 tabs open?
--so 13.77% have more than 10 tabs open
--10,493 distinct users returned with more than 10 tabs open out of 76190 users in the study



--What fraction of users have had more than 15 tabs open?

--6456 distinct users out of 76190 in the study
--8.4% have more than 15 tabs open


-- ● Compare the two features and create a coherent recommendation for your boss.


-- ○ Do you agree or disagree with your opinionated colleague?
-- ○ Do you think the team should go in a different direction?
-- ● Include analysis of data with statistics and outliers.
-- ● Include recommendation with predicted outcomes and identified action items.
-- ● Present any limitations and assumptions.
-- ● Identify follow-up problems and questions for future analysis.

-- 3. SQL Queries + Questions:
-- Due: beginning of Lesson 14 Format: .sql file
-- ● List the appropriate business questions you were trying to answer.
-- ● Use correct, efficient syntax for the functions and operators needed.
-- ● Include corresponding output listed in the .sql file.



-- GETTING STARTED
-- Consider the Data Analytics Workflow to guide you through each step:
-- ● Identify and Understand the Problem: After considering the prompt, think generally about the problem and how you might want to approach it. Ideally, what type of data would you have to make a decision and produce a recommendation?
-- ● Access and Obtain the Data: Your company, Mozilla, is running its own PostgreSQL server, and the engineers who designed the survey have added that data to three tables: events, survey, and users. Connect to the appropriate server using the software of your choice (pgAdmin III or DBVisualizer, for example).
-- ○ To connect to the server, please use the following login credential with the firefox_database:
-- ■ url/host:
-- ● West-coast (includes Austin and Chicago) -
-- analyticsga.cuwj8wuu6wbh.us-west-2.rds.amazonaws.com
-- ● East-coast - analyticsga-east2.c20gkj5cvu3l.us-east-1.rds.amazonaws.com
-- ● APAC- analyticsga-apac2.csuojbfcexhv.ap-southeast-2.rds.amazonaws.co m
-- ● Europe - analyticsga-west1.c8yztxlaoku1.eu-west-1.rds.amazonaws.com
-- ■ port: 5432
-- ■ username: analytics_student
-- ■ password: analyticsga
-- ● Understand the Data:   Your colleagues in the engineering department are very organized and have written documentation for the product managers who need to use their databases. Make sure you read it!  Link to documentation —note that the live site has been taken down but the web archive works great!
--       ○
-- HINT: Make sure to identify which user actions will be of most use to your research questions. Browse the tables and ensure you know how the data is organized and how the tables relate to each other. Answer basic questions about the data. When presenting the results of survey data, it’s often good to inform your audience about the characteristics of the surveyed users. Do you think these users are representative of all Firefox users? Why or why not? What other limitations might exist with this data?
-- ● Prepare, Structure, and Clean the Data: In order to be able to settle on your recommendation and create your presentation, you will need to write a number of queries to prepare, structure, filter, clean, and aggregate your data.

-- AN
-- Unit 2 Project
-- ● Analyze and Visualize the Data: In order to determine findings and create a recommendation, you will want to use statistical (mean, median, mode, min, max, etc.) functions as well as other aggregate functions (count) to summarize your data. Export your data to Excel to create any visualizations that will help you either explore your data or provide evidence for your recommendation.
-- ● Present the Results of Analysis: Based on your findings, create a coherent argument about which project is more worthwhile: tabs or bookmarks.
-- ● Create a PowerPoint presentation that summarizes your findings and makes a recommendation.
-- ● Make sure to include the results of your analysis and any visualizations that help boost your argument.
