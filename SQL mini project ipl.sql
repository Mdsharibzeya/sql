use ipl;
show tables;
select * from ipl_bidder_details;
select * from ipl_bidder_points;
select * from ipl_bidding_details;
select * from ipl_match;
select * from ipl_match_schedule;
select * from ipl_player;
select * from ipl_stadium;
select * from ipl_team;
select * from ipl_team_players;
select * from ipl_team_standings;
select * from ipl_tournament;
select * from ipl_user;


-- question 1
-- 1 Show the percentage of wins of each bidder in the order of highest to lowest percentage.
SELECT IPL_BIDDING_DETAILS.BIDDER_ID, COUNT(IPL_BIDDING_DETAILS.BID_STATUS) , NO_OF_BIDS,
(COUNT(IPL_BIDDING_DETAILS.BID_STATUS)/NO_OF_BIDS)*100 AS PERCENTAGE_WIN
FROM IPL_BIDDING_DETAILS
INNER JOIN IPL_BIDDER_POINTS
ON IPL_BIDDING_DETAILS.BIDDER_ID = IPL_BIDDER_POINTS.BIDDER_ID
AND IPL_BIDDING_DETAILS.BID_STATUS ='Won'
GROUP BY IPL_BIDDING_DETAILS.BIDDER_ID, NO_OF_BIDS
ORDER BY PERCENTAGE_WIN DESC;

-- question2
-- 2.Display the number of matches conducted at each stadium with stadium name, city from the database.
SELECT IPL_STADIUM.STADIUM_ID, STADIUM_NAME,CITY , COUNT(IPL_STADIUM.STADIUM_ID) AS TOTAL_MATCHES
FROM IPL_STADIUM
INNER JOIN IPL_MATCH_SCHEDULE
ON IPL_STADIUM.STADIUM_ID = IPL_MATCH_SCHEDULE.STADIUM_ID
GROUP BY IPL_STADIUM.STADIUM_ID,STADIUM_NAME
ORDER BY TOTAL_MATCHES;

-- question 3
-- 3.	In a given stadium, what is the percentage of wins by a team which has won the toss?
select stadium_id 'Stadium ID', stadium_name 'Stadium Name',
(select count(*) from ipl_match m join ipl_match_schedule ms on m.match_id = ms.match_id
where ms.stadium_id = s.stadium_id and (toss_winner = match_winner)) /
(select count(*) from ipl_match_schedule ms where ms.stadium_id = s.stadium_id) * 100 
as 'Percentage of Wins by teams who won the toss (%)'
from ipl_stadium s;

-- question 4
-- 4.Show the total bids along with bid team and team name.
SELECT COUNT(BID_TEAM) ,BID_TEAM,IPL_TEAM.TEAM_NAME
FROM IPL_BIDDING_DETAILS
INNER JOIN IPL_TEAM
ON IPL_BIDDING_DETAILS.BID_TEAM = IPL_TEAM.TEAM_ID
GROUP BY BID_TEAM;

-- question 5
-- 5.Show the team id who won the match as per the win details.
SELECT TEAM_ID, TEAM_NAME, TEAM_ID1, TEAM_ID2, MATCH_WINNER,IPL_MATCH.WIN_DETAILS
FROM IPL_TEAM
INNER JOIN IPL_MATCH
ON SUBSTR(IPL_TEAM.REMARKS,1,3) = SUBSTR(IPL_MATCH.WIN_DETAILS,6,3);

-- question 6
-- 6.Display total matches played, total matches won and total matches lost by team along with its team name.
SELECT IPL_TEAM_STANDINGS.TEAM_ID,IPL_TEAM.TEAM_NAME,
SUM(IPL_TEAM_STANDINGS.MATCHES_PLAYED) AS TOTAL_MATCH_PLAYED,
SUM(IPL_TEAM_STANDINGS.MATCHES_WON) AS WON_MATCHES,
SUM(IPL_TEAM_STANDINGS.MATCHES_LOST) AS LOST_MATCHES
FROM IPL_TEAM_STANDINGS
INNER JOIN IPL_TEAM
ON IPL_TEAM_STANDINGS.TEAM_ID=IPL_TEAM.TEAM_ID
GROUP BY IPL_TEAM_STANDINGS.TEAM_ID;

-- question 7
-- 7.Display the bowlers for Mumbai Indians team.
SELECT IPL_TEAM_PLAYERS.PLAYER_ID,IPL_TEAM.TEAM_NAME,IPL_TEAM_PLAYERS.REMARKS,PLAYER_ROLE, PLAYER_NAME
FROM IPL_PLAYER
INNER JOIN IPL_TEAM_PLAYERS
ON IPL_TEAM_PLAYERS.PLAYER_ID = IPL_PLAYER.PLAYER_ID
AND PLAYER_ROLE LIKE '%Bowler%'
INNER JOIN IPL_TEAM
ON IPL_TEAM.TEAM_ID = IPL_TEAM_PLAYERS.TEAM_ID
AND TEAM_NAME LIKE '%Mumbai%'
ORDER BY PLAYER_ID;

-- question 8
-- 8.How many all-rounders are there in each team, Display the teams with more than 4 
-- all-rounder in descending order.

SELECT TEAM_NAME, PLAYER_ROLE, COUNT(PLAYER_ROLE) AS TOTAL
FROM IPL_TEAM
INNER JOIN IPL_TEAM_PLAYERS
ON SUBSTR(IPL_TEAM.REMARKS,-2) = SUBSTR(IPL_TEAM_PLAYERS.REMARKS,-2)
GROUP BY PLAYER_ROLE, TEAM_NAME
HAVING PLAYER_ROLE LIKE 'All-Rounder' AND COUNT(PLAYER_ROLE) > 4
ORDER BY COUNT(PLAYER_ROLE) DESC;

