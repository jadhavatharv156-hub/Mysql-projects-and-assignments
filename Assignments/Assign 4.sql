create database practice_ques;
use practice_ques;

CREATE TABLE IPL_Players (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Team_Name VARCHAR(50),
    Matches_Played INT,
    Runs_Scored INT,
    Role VARCHAR(20)
);

INSERT INTO IPL_Players VALUES
(1, 'Virat Kohli', 'RCB', 250, 7500, 'Batsman'),
(2, 'MS Dhoni', 'CSK', 230, 5000, 'Wicketkeeper'),
(3, 'Rohit Sharma', 'MI', 240, 7300, 'Batsman'),
(4, 'Hardik Pandya', 'GT', 120, 2100, 'All-rounder'),
(5, 'Rashid Khan', 'GT', 100, 500, 'Bowler'),
(6, 'KL Rahul', 'LSG', 130, 4500, 'Batsman'),
(7, 'David Warner', 'DC', 150, 6000, 'Batsman'),
(8, 'Jasprit Bumrah', 'MI', 110, 100, 'Bowler'),
(9, 'Shubman Gill', 'GT', 80, 2800, 'Batsman'),
(10, 'Andre Russell', 'KKR', 120, 1900, 'All-rounder'),
(11, 'Suresh Raina', 'CSK', 200, 5500, 'Batsman'),
(12, 'Yuzvendra Chahal', 'RR', 115, 50, 'Bowler'),
(13, 'Ben Stokes', 'CSK', 50, 800, 'All-rounder'),
(14, 'Faf du Plessis', 'RCB', 140, 4200, 'Batsman'),
(15, 'Dinesh Karthik', 'RCB', 220, 4100, 'Wicketkeeper'),
(16, 'Sunil Narine', 'KKR', 130, 950, 'All-rounder'),
(17, 'Glenn Maxwell', 'RCB', 90, 2500, 'All-rounder'),
(18, 'Mohammed Shami', 'GT', 110, 60, 'Bowler'),
(19, 'Sanju Samson', 'RR', 130, 3600, 'Wicketkeeper'),
(20, 'Kane Williamson', 'SRH', 95, 2100, 'Batsman');

select * from Ipl_players;

-- 🔸 Find players who scored more runs than the average runs of all players.
select * 
from Ipl_players 
where runs_scored >(
select avg(runs_scored)
from Ipl_players
);

-- 🔸 Find the team with the highest run scorer.
select team_name 
from ipl_players
order by runs_scored desc
limit 1;

-- 🔸 List players who played more matches than MS Dhoni.
select player_name
from ipl_players
where matches_played >(
	select matches_played
    from ipl_players
	where player_name = "MS Dhoni"
);

-- 🔸 Find all players from the team with the most total runs.
select * 
from IPl_players 
where team_name = (
select team_name 
from ipl_players 
group by team_name 
order by sum(runs_scored) desc
limit 1
);

-- 🔸 Find all bowlers who played fewer matches than the average of all players.
select * from ipl_players
where role= "bowler" and matches_played <(
select avg(matches_played) from ipl_players
);

-- 🔸 Find all players whose run count is within the top 5 highest.
select * ,
rank () over (order by runs_scored desc)
from ipl_players
limit 5;

-- 🔸 Count number of players in each role.
select role, count(*) as total_players
from ipl_players
group by role;

-- 🔸 Find teams with more than 3 players
select team_name ,
count(player_id)as total_players
from ipl_players
group by team_name 
having count(player_id)>3;

-- 🔸 Find average runs scored by role.
select role ,
avg(runs_scored) as avg_runs
from ipl_players
group by role;

-- 🔸 List teams where total runs are more than 10,000.
select team_name ,
sum(runs_scored) as total_runs 
from ipl_players
group by team_name
having total_runs > 10000;

-- 🔸 Count players per team with average matches over 100.
select team_name , 
count(player_id) as count_players ,
avg(matches_played) as avg_matches
from ipl_players
group by team_name
having avg_matches > 100;

-- 🔸 Find number of players for each role with more than 1000 runs.
select role,
count(player_id) as number_of_players
from ipl_players
where runs_scored > 1000
group by role;

-- 🔸 Which role has highest total runs?
select role ,
sum(runs_scored) as highest_runs
from ipl_players
group by role
order by sum(runs_scored) desc
limit 1;

-- 🔸 Rank players based on runs scored.
select player_name , runs_scored ,
rank () over (order by runs_scored desc) as rank_player
from ipl_players;

-- 🔸 Find cumulative runs per team.
select team_name , runs_scored ,
sum(runs_scored) over (partition by team_name order by runs_scored desc) as cumulative_runs
from ipl_players;

-- 🔸 Get top scorer per team.
select team_name , player_name , runs_scored 
from (
select team_name , player_name , runs_scored ,
row_number() over (partition by team_name order by runs_scored desc ) as top_scorer
from ipl_players) as aa
where top_scorer = 1;

-- 🔸 Add average runs of each role per player.
select player_name , role ,
avg(runs_scored) over (partition by role) as avg_runs_per_Role
from ipl_players;

-- 🔸 Calculate difference between each player's runs and the average in their team.
select player_name ,
avg(runs_scored) over (partition by team_name) as avg_run_score_team ,
runs_scored - avg(runs_scored) over (partition by team_name) as differnt_than_team_avg
from ipl_players;

-- 🔸 Running total of runs scored sorted by matches played.
select * ,
sum(runs_scored) over (order by matches_played) as total_running_runs
from ipl_players;
