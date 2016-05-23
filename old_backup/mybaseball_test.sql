use mybaseball;
SHOW tables;

CALL load_rank_table(1);
CALL load_batter_record_of_team(1);

select team_id, team_name, location from team;
    
select player_id, player_name, birth, if(pro = 1, '선출', '비선출') as pro, highschool, main_position from player;


	SELECT g.game_id, l.league_name as league , g.round as round , g.gameday as date , th.team_name as hometeam , ta.team_name as awayteam
	FROM game as g 
		LEFT JOIN team as th
		ON g.hometeam = th.team_id
		LEFT JOIN team as ta
		ON g.awayteam = ta.team_id
		LEFT JOIN league as l
		ON g.league_id = l.league_id
        ;


select l.league_year as season, l.league_name, l.league_id, g.game_id, g.round, g.gameday, g.hometeam , g.awayteam, 
(select team_name from team where team_id = g.hometeam) as hteam_name, g.hscore,
(select team_name from team where team_id = g.awayteam) as ateam_name, g.ascore, 
g.result
from game as g
	LEFT JOIN league as l
    ON g.league_id = l.league_id
where game_id = 1;
select * from batter_record where game_id= 1;


select g.* , b.*
FROM (select * from batter_record where player_id = 76) as b
	LEFT JOIN (
		SELECT DATE_FORMAT(g.gameday,'%Y년 %m월 %d일') as gameday, g.hometeam as hteam_id, g.awayteam as ateam_id,  g.game_id, l.league_id, l.league_name , g.round as round , g.gameday as date , th.team_name as hometeam , ta.team_name as awayteam
		FROM game as g 
			LEFT JOIN team as th
			ON g.hometeam = th.team_id
			LEFT JOIN team as ta
			ON g.awayteam = ta.team_id
			LEFT JOIN league as l
			ON g.league_id = l.league_id
			) as g
    ON g.game_id = b.game_id;

CALL load_player_history(76);

CALL load_game_info(3);
select * from batter_record where game_id = 3;
CALL load_batter_record_of_game(29);
CALL load_batter_record_of_game_team(29);


	SELECT p.player_id, p.player_name, b.total_plate, at_bat,
		hit+hit2+hit3+hr AS total_hit, hit, hit2, hit3, hr,
		if( at_bat = 0 , '-', (hit+hit2+hit3+hr)/at_bat) as `타율`,
		if( at_bat = 0 , '-', (hit+hit2*2+hit3*3+hr*4)/at_bat) as `장타율`,
		rbi, sb r, bb, k ,  COALESCE(hbp, 0) as hbp ,
		sac_fly as sacf, sac_bunt as sacb,
		if( COALESCE(at_bat, 0) + COALESCE(sac_fly, 0) + COALESCE(bb, 0) + COALESCE(hbp, 0) = 0, '-', (hit+hit2+hit3+hr+bb+coalesce(hbp, 0))/(COALESCE(at_bat, 0) + COALESCE(sac_fly, 0) + COALESCE(bb, 0) + COALESCE(hbp, 0))) as `출루율`
	FROM
		(SELECT * FROM batter_record WHERE game_id = 29) as b
	INNER JOIN
		player AS p
	ON b.player_id = p.player_id
    where p.player_id in (select player_id from join_team where team_id  = 2);
    
CALL load_batter_record_of_game_team(29, 2);


select player_id from join_team where team_id  = 1;

select * from batter_record where player_id = 2;
select * from game where game_id = 33;

select * from batter_record;
select * from join_team WHERE team_id = 1;

select * FROM join_team as j LEFT JOIN player as p ON j.player_id = p.player_id WHERE team_id = 1;

SELECT FORMAT(0.1, 12);
