

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
