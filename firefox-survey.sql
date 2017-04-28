



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


-- ○ Review the Users table. Summarize the users represented in the survey.

SELECT * FROM users LIMIT 100;


SELECT count(*) from users;

--27,267 users



-- ○ Review the Survey table. How many of the total users completed the survey?

--4,081 of the 27,267 users answered survey questions (14.9%)


-- ○ Of users who completed the survey, identify the number of users who are new toFirefox, as well as those who are longtime users.

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

--broken apaverageart by how long they used Firefox

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

SELECT survey.q1, ROUND (stddev_samp (CAST( rtrim(events.data1,' total bookmarks') as integer)),0) as bookmarks from events
JOIN survey using(user_id)
WHERE events.event_code = 8
GROUP BY survey.q1
ORDER BY survey.q1;

--the longer people have used Firefox the more book marks they have and the more they use them
--avg of 494 (stddev 126) chooses for less than 3 months group
--avg of 120 (stddev of 25) chooses for 3 to 6 months group
--avg of 219 (stddev of 275) chooses for 6 months to a year group
--avg of 794 (stddev of 184) chooses for 1 to 2 years group
--avg of 1639 (stddev of 450) chooses for 2 to 3 years group
--avg of 4,129 (stddev of 812) chooses for 3 to 5 years group
--avg of 4,240 (stddev of 771) chooses for more than 5 years group



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


SELECT survey.q1, ROUND(AVG(CAST( rtrim(events.data2,' tabs') as integer )),0) FROM events
JOIN survey using(user_id)
WHERE events.event_code = 26
GROUP BY survey.q1
ORDER BY survey.q1;

--the longer people have used Firefox the more tabs open they have
--average of 8 (stddev of 11) for less than 3 months group
--average of 2 (stddev of 2) for 3 to 6 months group
--average of 4 (stddev of 8) for 6 months to a year group
--average of 5 (stddev of 9) for 1 to 2 years group
--average of 5 (stddev of 6) for 2 to 3 years group
--average of 6 (stddev of 7) for 3 to 5 years group
--average of 12 (stddev of 26) for more than 5 years group





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


