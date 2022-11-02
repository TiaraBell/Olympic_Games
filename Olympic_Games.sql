CREATE TABLE athlete_events (
	id int,
	name varchar,
	sex varchar,
	age varchar,
	height varchar,
	weight varchar,
	team varchar,
	noc varchar,
	games varchar,
	year int,
	season varchar,
	city varchar,
	sport varchar,
	event varchar,
	medal varchar	
);

CREATE TABLE noc_regions (
	noc varchar,
	region varchar,
	notes varchar
);

-- 1. How many olympics games have been held?
SELECT COUNT(DISTINCT(games)) AS total_olympic_games
FROM athlete_events;

-- 2. List down all Olympics games held so far.
SELECT DISTINCT(year), season, city
FROM athlete_events
ORDER BY year;

-- 3. What was the total no of nations who participated in each olympics game?
SELECT games, COUNT(DISTINCT(noc)) AS total_countries
FROM athlete_events
GROUP BY games;

-- 4. Which year saw the highest and lowest no of countries participating in olympics
SELECT year, COUNT(DISTINCT(noc)) AS num_countries
FROM athlete_events
GROUP BY year
ORDER BY num_countries;

-- 5. What sports were played during the winter?
SELECT DISTINCT(sport) 
FROM athlete_events
WHERE games LIKE '%Winter'
ORDER BY sport;

-- 6. Which sports were just played only once in the olympics.
SELECT sport, COUNT(DISTINCT(sport)) 
FROM athlete_events
GROUP BY sport
HAVING COUNT(DISTINCT Games) = 1
ORDER BY Sport;

-- 7. Fetch the total no of sports played in each olympic games.
SELECT games, COUNT(DISTINCT(sport)) AS num_sports
FROM athlete_events
GROUP BY games
ORDER BY games;

-- 8. Who are the oldest athletes to win a gold medal?
SELECT name, age, medal
FROM athlete_events
WHERE medal = 'Gold' AND age != 'NA'
ORDER BY age DESC;

-- 9. Which team had the most female gold medalists?
SELECT COUNT(sex) AS female_medalists, medal, team 
FROM athlete_events
WHERE medal = 'Gold' AND sex = 'F'
GROUP BY team, medal
ORDER BY female_medalists DESC; 


-- 10. What country has the most gold medalists?
SELECT noc, COUNT(medal) AS num_gold_medals
FROM athlete_events
WHERE medal = 'Gold'
GROUP BY noc
ORDER by num_gold_medals DESC;
