--1. Create a table named ‘matches’ with appropriate data types for columns
create table matches(
	id integer primary key,
	city text,
	date date,
	player_of_match text,
	venue text,	
	neutral_venue integer,
	team1 text,	
	team2 text,	
	toss_winner text,	
	toss_decision text,	
	winner text,	
	result text,	
	result_margin integer,
	eliminator text,	
	method text,	
	umpire1	text,
	umpire2 text)

--2. Create a table named ‘deliveries’ with appropriate data types for columns
create table deliveries(
	id int,
	inning int,
	over int,	
	ball int,	
	batsman	text,
	non_striker	text,
	bowler text,	
	batsman_runs int,	
	extra_runs int,	
	total_runs int,	
	is_wicket int,
	dismissal_kind text,	
	player_dismissed text,	
	fielder text,	
	extras_type text,	
	batting_team text,	
	bowling_team text)

--3. Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’
copy matches from 'F:\Program Files\Postgre SQL\data\data_copy\IPL_matches.csv' CSV header;

--4. Import data from CSV file ’IPL_Ball.csv’ attached in resources to ‘deliveries’
copy deliveries from 'F:\Program Files\Postgre SQL\data\data_copy\IPL_Ball.csv' CSV header;

--Testing data entered successful 
select * from matches
select * from deliveries

--5. Select the top 20 rows of the deliveries table.
select * from deliveries limit 20

--6. Select the top 20 rows of the matches table.
select * from matches limit 20

--7. Fetch data of all the matches played on 2nd May 2013.
select * from matches where date = '2013-05-02'

--8. Fetch data of all the matches where the margin of victory is more than 100 runs.
select * from matches where result_margin > 100

/*9. Fetch data of all the matches where the final scores of both teams tied and order it in
descending order of the date.*/
select * from matches where result = 'tie' order by date desc

--10. Get the count of cities that have hosted an IPL match.
select count(distinct city) as cities_hosted_IPL_match from matches

--Extra Queries

--11.Most run scored Batsman in IPL till date
create table orange_cap as select distinct batsman,sum(batsman_runs) as sum_runs from 
 deliveries where batsman_runs <> 0  group by batsman

select batsman as "Golden Batsman Award" from orange_cap where sum_runs = (select max(sum_runs) from orange_cap) 

--12.Most wickets taken Bowler in IPL till date
create table purple_cap as select distinct bowler,sum(is_wicket) as sum_wickets from 
 deliveries where is_wicket <> 0  group by bowler
 
select bowler as "Golden Bowler Award" from purple_cap where sum_wickets = (select max(sum_wickets) from purple_cap) 


 