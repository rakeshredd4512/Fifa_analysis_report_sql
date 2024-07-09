create database fifa

show tables;
select * from fifa19;

#how many players are there in the data set
select count(*) from fifa19;

#how many nationalities do these palyers belongs to
select count(distinct nationality) as no_of_nations from fifa;

#what is the total wage given to all palyers? whats the average and standard deviation?
select sum(wage) as total_wage,avg(wage),stddev(wage) from fifa;

#which nationality has the highest no of players ,what are the top 3 nationalityies by # of the player?
select nationality,count(*) as cnt from fifa 
group by nationality;

#which player has the highest wage ? and which has the lowest?
select name from fifa where wage=(select max(wage) from fifa);
select name from fifa where wage=(select min(wage) from fifa);

#the player having the best overall rating and the worst overall rating?
select name from fifa where overall=(select max(overall) from fifa);
select name from fifa where overall=(select min(overall) from fifa);

#Club having the highest total of overall rating? Highest Average of overall rating?
select club,count(*) as cnt,sum(overall) as tot_rating,avg(overall) from fifa
group by club;

#What are the top 5 clubs based on the average 	ratings of their players and their corresponding averages?
select club,count(*) as cnt,sum(overall) as tot_rating,avg(overall) from fifa
group by club
order by avg(overall) desc limit 5;

#How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select count(*) from fifa where joined between '20-05-2018' and '10-04-2019';

#What is the frequency distribution of nationalities among players whose club name starts with M?
select * from fifa where club like "m%";

#Which jersey number is the luckiest?
select * from fifa order by Penalties asc limit 1 ;

#How many players have joined their respective clubs date wise?
SELECT Joined, COUNT(*) AS NumberOfPlayers
FROM fifa19
GROUP BY Joined
ORDER BY Joined;

#How many players have joined their respective clubs yearly?
SELECT YEAR(Joined) AS YearJoined, COUNT(*) AS NumberOfPlayers
FROM fifa19
GROUP BY YEAR(Joined)
ORDER BY YearJoined;



#What is the distribution of players who prefer left foot vs right foot?
SELECT COUNT(*) AS frequency, `Preferred.Foot`
FROM FIFA19
GROUP BY `Preferred.Foot`
ORDER BY frequency DESC
LIMIT 0, 1000;

