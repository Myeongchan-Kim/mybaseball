CREATE DATABASE IF NOT EXISTS mybaseball;
SHOW DATABASES;
SELECT * FROM mysql.USER;
DROP USER IF EXISTS guest@localhost;
DROP USER IF EXISTS guest@'%';
CREATE USER guest@localhost IDENTIFIED BY 'aOVG1L2xDC';
GRANT  all privileges ON mybaseball.* TO guest@localhost;
SHOW GRANTS FOR guest@localhost;

USE mybaseball;
SHOW TABLES;

-- MySQL Workbench Synchronization
-- Generated: 2016-01-12 03:59
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Paul

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mybaseball` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `mybaseball`.`league` (
  `league_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `org_num` INT(11) NOT NULL COMMENT '',
  `league_year` YEAR NOT NULL COMMENT '',
  `league_name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`league_id`)  COMMENT '',
  INDEX `fk_league_organization1_idx` (`org_num` ASC)  COMMENT '',
  CONSTRAINT `fk_league_organization1`
    FOREIGN KEY (`org_num`)
    REFERENCES `mybaseball`.`organization` (`org_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`game` (
  `game_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `league_id` INT(11) NOT NULL COMMENT '',
  `round` VARCHAR(45) NOT NULL COMMENT '',
  `gameday` DATE NULL DEFAULT NULL COMMENT '',
  `gametime` TIME NULL DEFAULT NULL COMMENT '',
  `hometeam` INT(11) NULL DEFAULT NULL COMMENT '',
  `awayteam` INT(11) NULL DEFAULT NULL COMMENT '',
  `result` VARCHAR(5) NOT NULL COMMENT '',
  `hscore` INT(11) NULL DEFAULT NULL COMMENT '',
  `ascore` INT(11) NULL DEFAULT NULL COMMENT '',
  `scoreboard` TEXT NULL DEFAULT NULL COMMENT '',
  `location` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`game_id`)  COMMENT '',
  INDEX `fk_game_team_idx` (`hometeam` ASC)  COMMENT '',
  INDEX `fk_game_team1_idx` (`awayteam` ASC)  COMMENT '',
  INDEX `fk_game_league1_idx` (`league_id` ASC)  COMMENT '',
  CONSTRAINT `fk_game_team`
    FOREIGN KEY (`hometeam`)
    REFERENCES `mybaseball`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_team1`
    FOREIGN KEY (`awayteam`)
    REFERENCES `mybaseball`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `mybaseball`.`league` (`league_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`team` (
  `team_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `team_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `location` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `elo` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`team_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`player` (
  `player_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `player_name` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `birth` DATE NULL DEFAULT NULL COMMENT '',
  `pro` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  `highschool` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `main_position` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`player_id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`join_team` (
  `team_id` INT(11) NOT NULL COMMENT '',
  `player_id` INT(11) NOT NULL COMMENT '',
  `title` VARCHAR(10) NULL DEFAULT '주전' COMMENT '',
  `backnumber` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  INDEX `fk_team_player_team1_idx` (`team_id` ASC)  COMMENT '',
  INDEX `fk_team_player_player1_idx` (`player_id` ASC)  COMMENT '',
  PRIMARY KEY (`team_id`, `player_id`)  COMMENT '',
  CONSTRAINT `fk_team_player_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mybaseball`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_player_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `mybaseball`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`pitcher_record` (
  `game_id` INT(11) NOT NULL COMMENT '',
  `player_id` INT(11) NOT NULL COMMENT '',
  `out_get` INT(11) NULL DEFAULT NULL COMMENT '',
  `winner` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  `hold` TINYINT(1) NULL DEFAULT NULL COMMENT '',
  `k` INT(11) NULL DEFAULT NULL COMMENT '',
  `bb` INT(11) NULL DEFAULT NULL COMMENT '',
  `hbp` INT(11) NULL DEFAULT NULL COMMENT '',
  `run` INT(11) NULL DEFAULT NULL COMMENT '',
  `earn_run` INT(11) NULL DEFAULT NULL COMMENT '',
  `detail` TEXT NULL DEFAULT NULL COMMENT '',
  INDEX `fk_pitcher_record_game1_idx` (`game_id` ASC)  COMMENT '',
  INDEX `fk_pitcher_record_player1_idx` (`player_id` ASC)  COMMENT '',
  PRIMARY KEY (`game_id`, `player_id`)  COMMENT '',
  CONSTRAINT `fk_pitcher_record_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `mybaseball`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pitcher_record_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `mybaseball`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`batter_record` (
  `game_id` INT(11) NOT NULL COMMENT '',
  `player_id` INT(11) NOT NULL COMMENT '',
  `total_plate` INT(11) NULL DEFAULT NULL COMMENT '',
  `at_bat` INT(11) NULL DEFAULT NULL COMMENT '',
  `hit` INT(11) NULL DEFAULT NULL COMMENT '',
  `hit2` INT(11) NULL DEFAULT NULL COMMENT '',
  `hit3` INT(11) NULL DEFAULT NULL COMMENT '',
  `hr` INT(11) NULL DEFAULT NULL COMMENT '',
  `r` INT(11) NULL DEFAULT NULL COMMENT '',
  `rbi` INT(11) NULL DEFAULT NULL COMMENT '',
  `bb` INT(11) NULL DEFAULT NULL COMMENT '',
  `k` INT(11) NULL DEFAULT NULL COMMENT '',
  `hbp` INT(11) NULL DEFAULT NULL COMMENT '',
  `sac_fly` INT(11) NULL DEFAULT NULL COMMENT '',
  `sac_bunt` INT(11) NULL DEFAULT NULL COMMENT '',
  `sb` INT(11) NULL DEFAULT NULL COMMENT '',
  `detail` TEXT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`game_id`, `player_id`)  COMMENT '',
  INDEX `fk_batter_record_player1_idx` (`player_id` ASC)  COMMENT '',
  CONSTRAINT `fk_batter_record_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `mybaseball`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_batter_record_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `mybaseball`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '	';

CREATE TABLE IF NOT EXISTS `mybaseball`.`versus_player` (
  `vs_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `game_id` INT(11) NOT NULL COMMENT '',
  `pitcher_id` INT(11) NOT NULL COMMENT '',
  `batter_id` INT(11) NOT NULL COMMENT '',
  `cur_inning` INT(11) NOT NULL COMMENT '',
  `cur_base` INT(11) NULL DEFAULT NULL COMMENT '',
  `result` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  INDEX `fk_versus_player1_idx` (`pitcher_id` ASC)  COMMENT '',
  INDEX `fk_versus_player2_idx` (`batter_id` ASC)  COMMENT '',
  INDEX `fk_versus_game1_idx` (`game_id` ASC)  COMMENT '',
  PRIMARY KEY (`vs_id`)  COMMENT '',
  CONSTRAINT `fk_versus_player1`
    FOREIGN KEY (`pitcher_id`)
    REFERENCES `mybaseball`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_versus_player2`
    FOREIGN KEY (`batter_id`)
    REFERENCES `mybaseball`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_versus_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `mybaseball`.`game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`organization` (
  `org_num` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `org_name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`org_num`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mybaseball`.`participate` (
  `league_id` INT(11) NOT NULL COMMENT '',
  `team_id` INT(11) NOT NULL COMMENT '',
  `record` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`league_id`, `team_id`)  COMMENT '',
  INDEX `fk_participate_legue1` (`league_id` ASC)  COMMENT '',
  INDEX `fk_participate_team1` (`team_id` ASC)  COMMENT '',
  CONSTRAINT `fk_participate_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `mybaseball`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participate_legue1`
    FOREIGN KEY (`league_id`)
    REFERENCES `mybaseball`.`league` (`league_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


DROP VIEW show_games IF EXISTS;
CREATE VIEW show_games AS
	SELECT game_id, l.league_id AS league_id, l.league_name AS league_name, round, gameday, th.team_id as h_id, th.team_name AS home, ta.team_id AS a_id, ta.team_name AS away, result, hscore, ascore 
	FROM game g, team th, team ta , league l
	WHERE g.hometeam = th.team_id AND g.awayteam = ta.team_id AND g.league_id = l.league_id;

DELIMITER $$
USE `mybaseball`$$
CREATE PROCEDURE `load_rank_table`( IN league_number int)
BEGIN
SELECT team_name,  COALESCE(win.`승`,0) as `승` ,COALESCE(draw.`무`,0) as `무` , COALESCE(lose.`패`,0) as `패` , COALESCE(win.`승`,0)/(COALESCE(lose.`패`,0)+COALESCE(win.`승`,0)+COALESCE(draw.`무`,0)) AS 승률 
FROM ( 
	(SELECT * FROM participate WHERE league_id = league_number) as p
    LEFT JOIN 
		team as t
	ON p.team_id = t.team_id
    LEFT JOIN 
		(
		SELECT SUM(win) as '승', t_id FROM (
			(SELECT count(*) as win, awayteam as t_id FROM game WHERE league_id = league_number AND result = '패' group by awayteam)
			UNION ALL
			(SELECT count(*) as win, hometeam as t_id FROM game WHERE league_id = league_number AND result = '승' group by hometeam)
			) AS w
		GROUP BY t_id
		) as win
	ON p.team_id = win.t_id
	LEFT JOIN 
		(
		SELECT SUM(win) as '무', t_id FROM (
			(SELECT count(*) as win, awayteam as t_id FROM game WHERE league_id = league_number AND result = '무' group by awayteam)
			UNION ALL
			(SELECT count(*) as win, hometeam as t_id FROM game WHERE league_id = league_number AND result = '무' group by hometeam)
			) AS d
		GROUP BY t_id
		) as draw
	ON p.team_id = draw.t_id
    LEFT JOIN 
		(
		SELECT SUM(lose) as '패', t_id  FROM (
			(SELECT count(*) as lose, awayteam as t_id FROM game WHERE league_id = league_number AND result = '승' group by awayteam)
			UNION ALL
			(SELECT count(*) as lose, hometeam as t_id FROM game WHERE league_id = league_number AND result = '패' group by hometeam)
			) AS w
		GROUP BY t_id
		) as lose
	ON p.team_id = lose.t_id
    )
ORDER BY `승률` DESC
;
END$$
DELIMITER ;

CALL load_rank_table(1);
CALL load_rank_table(2);

SELECT game_id, league_name, round, gameday AS '경기날짜', home, away, result AS '결과' , hscore, ascore FROM show_games where league_id = 1;

SELECT game_id , league_name , round , gameday , home, away, result, hscore, ascore
            FROM show_games where league_id = 1;
            
DESC organization;
SELECT * FROM organization;
INSERT INTO organization (org_num, org_name) values (1, '한양대학교 야구연합회');
INSERT INTO organization (org_num, org_name) values(2, '쥬신 청량중리그');
INSERT INTO organization VALUES (3, '비공식 경기');

DESC league;
SELECT * FROM league;
INSERT INTO league ( league_id , org_num, league_year, league_name) values (1, 1, 2010, '한양리그');
INSERT INTO league ( league_id , org_num, league_year, league_name) values (2, 2, 2010, '청량중 토요리그');
INSERT INTO league ( league_id , org_num, league_year, league_name) values (3, 3, 2010, '비공식경기');

USE mybaseball;
DESC team;
SELECT * FROM team;
INSERT INTO team ( team_id, team_name, location, elo) values (1, '짤유', '서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (2, 'Bullets', '서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (3, 'Metros','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (4, 'Civilians','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (5, '행당Hits','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (6, '아슬아슬','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (7, '디독스','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (8, '언더독','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (10, '루키즈','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (11, 'MBCtalent','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (12, '레전드','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (13, 'D-train','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (14, 'GS타임즈','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (15, '기타', '기타', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (16, '에스큘레피우스','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (17, 'AceBraves','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (18, '불새','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (19, '러쉬','서울', NULL);
INSERT INTO team ( team_id, team_name, location, elo) values (20, '올베','서울', NULL);


USE mybaseball;
DESC game;
SELECT * FROM game;

INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (1,3,'비공식','2010-01-18',1,8,'패',0,1);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (2,3,'비공식','2010-01-26',1,8,'패',4,8);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (3,3,'비공식','2010-02-22',1,2,'무',0,0);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (4,3,'비공식','2010-03-02',1,20,'패',0,1);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (5,3,'비공식','2010-03-15',1,2,'무',2,2);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (6,1,'리그경기','2011-03-15',1,10,'패',7,9);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (7,1,'리그경기','2010-03-29',1,2,'패',6,15);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (8,1,'리그경기','2010-04-05',1,8,'승',12,11);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (9,2,'리그경기','2010-04-12',1,11,'패',6,11);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (10,3,'비공식','2010-04-12',1,12,'패',10,14);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (11,2,'리그경기','2010-04-26',1,14,'승',7,5);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (12,2,'리그경기','2010-05-10',1,13,'패',4,11);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (13,1,'리그경기','2010-05-17',1,4,'패',7,10);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (14,2,'리그경기','2010-05-24',1,17,'패',2,14);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (15,1,'리그경기','2010-06-07',1,7,'승',9,8);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (16,3,'비공식','2010-06-28',1,2,'패',3,15);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (17,2,'리그경기','2010-07-12',1,19,'패',6,11);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (18,1,'리그경기','2010-08-30',1,16,'승',24,9);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (19,3,'비공식','2010-06-05',1,18,'패',3,7);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (20,2,'리그경기','2010-09-27',1,13,'패',3,10);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (21,2,'리그경기','2010-09-27',1,17,'패',7,8);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (22,2,'리그경기','2010-10-25',1,12,'패',8,10);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (23,2,'리그경기','2010-11-08',1,11,'승',12,8);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (24,2,'리그경기','2011-12-13',1,19,'패',8,15);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (25,2,'리그경기','2011-02-28',1,14,'패',10,17);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (26,2,'리그경기','2011-02-28',1,12,'패',11,13);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (27,1,'리그경기','2010-10-04',1,6,'패',11,12);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (28,1,'리그경기','2010-11-01',1,7,'패',4,15);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (29,1,'리그경기','2010-02-26',7,2,'패',4,10);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (31,1,'리그경기','2010-02-26',2,4,'무',7,7);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (33,1,'리그경기','2010-03-05',8,3,'승',18,0);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (35,1,'리그경기','2010-03-05',8,6,'승',10,0);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (37,1,'리그경기','2010-03-12',5,7,'패',5,7);
INSERT INTO `game` (`game_id`,`league_id`,`round`,`gameday`,`hometeam`,`awayteam`,`result`,`hscore`,`ascore`) VALUES (39,1,'리그경기','2010-03-12',8,7,'패',2,9);

USE mybaseball;
DESC participate;
SELECT * FROM participate;
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 1, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 2, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 3, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 4, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 5, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 6, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 7, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 8, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 10, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 11, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 12, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 13, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 14, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 15, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 16, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 17, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 18, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 19, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 3, 20, '');

INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 1, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 2, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 3, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 4, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 5, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 6, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 7, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 8, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 10, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 16, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 1, 18, '');

INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 1, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 11, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 12, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 13, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 14, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 17, '');
INSERT INTO `participate` (`league_id`,`team_id`,`record` ) VALUES ( 2, 19, '');

USE mybaseball;
DESC player;
SELECT * FROM player;

INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (1,'최경호','1986-01-16',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (2,'정인욱','1987-09-17',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (3,'유환수','1987-08-17',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (4,'김건희','1987-05-06',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (5,'박병석','1989-03-23',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (6,'최성락','1988-10-06',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (7,'신수용','1988-09-09',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (8,'최문규','1986-05-12',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (9,'최강현','1987-12-23',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (10,'김낙현','1987-07-01',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (11,'김동원','1978-02-18',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (12,'김동윤','1985-03-02',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (13,'김우환','1987-06-19',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (14,'김지형','1990-08-22',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (15,'박지용','1988-01-18',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (16,'박진석','1986-10-10',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (17,'박천호','1986-10-08',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (18,'이명규','1987-12-06',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (19,'이종후','1987-07-01',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (20,'이준용','1978-11-15',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (21,'이호','1986-01-22',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (22,'정진','1986-10-02',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (23,'주환익','1986-10-03',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (24,'한지헌','1985-09-08',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (25,'권순호','1983-04-20',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (26,'김경원','1984-09-01',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (27,'박승환','1987-02-23',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (28,'유주태','1984-06-19',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (29,'윤재천','1988-01-15',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (30,'이겨레','1987-11-02',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (31,'임성훈','1982-11-22',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (32,'전병익','1985-08-17',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (33,'전영표','1983-04-20',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (34,'황의상','1988-02-24',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (35,'홍준의','1986-05-19',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (36,'정현수','1991-01-08',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (37,'이동훈','1982-12-04',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (38,'박주형','1989-04-24',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (39,'김성수','1964-02-20',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (40,'정웅교','1987-09-22',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (41,'서종진','1969-02-07',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (42,'변훈','1966-10-30',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (43,'김건욱','1970-01-13',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (44,'김기범','1970-01-29',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (45,'정인서','1968-10-10',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (46,'이상목','1970-08-30',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (47,'표정현','1970-04-15',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (48,'이상현','1973-11-22',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (49,'이종용','1987-10-01',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (50,'홍영민','1983-08-29',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (51,'이문배','1980-01-31',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (52,'배관호','1984-07-10',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (53,'임재관','1984-04-08',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (54,'차승환','1983-03-22',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (55,'조기정','1983-11-16',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (56,'김정우','1986-05-16',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (57,'서준혁','1984-11-12',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (58,'오용민','1986-06-18',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (59,'김우석','1982-05-03',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (60,'안수한','1986-10-13',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (61,'조승표','1988-03-01',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (62,'야나기와 타카유키','1987-04-13',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (63,'이중배','1986-06-16',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (64,'박종주','1987-03-23',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (65,'강기철','1986-08-10',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (66,'나의석','1983-07-05',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (67,'신진범','1987-06-09',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (68,'전경훈','1984-01-17',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (69,'홍대정','1986-12-26',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (70,'허정','1988-10-01',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (71,'장다솔','1986-03-01',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (72,'장한솔','1984-12-16',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (73,'김세훈','1985-04-23',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (74,'구찬우','1988-09-25',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (75,'김명찬','1985-12-14',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (76,'김무건','1986-01-10',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (77,'김연각','1988-05-28',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (78,'김윤성','1989-02-04',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (79,'김재현','1984-04-25',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (80,'남진훈','1986-04-25',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (81,'문종열','1986-05-16',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (82,'문준혁','1990-02-10',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (83,'박정우','1988-01-13',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (84,'서준상','1986-03-18',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (85,'여현철','1985-01-04',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (86,'이경준','1986-01-30',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (87,'이정룡','1984-09-25',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (88,'이철민','1986-12-04',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (89,'이호준','1987-09-24',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (90,'정지훈','1987-03-02',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (91,'최목','1984-11-15',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (92,'최일준','1987-02-22',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (93,'최형승','1989-07-20',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (94,'김우경','1988-10-24',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (95,'문정우','1993-01-04',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (96,'이태엽','1986-09-29',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (97,'유재석','1983-06-10',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (98,'김상윤','1985-08-03',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (99,'윤석호','1979-01-20',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (100,'정훈영','1983-03-29',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (101,'복종욱','1983-05-03',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (102,'이시우','1988-03-23',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (103,'백광선','1984-09-01',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (104,'황창준','1983-11-17',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (105,'이석찬','1983-09-01',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (106,'문치권','1985-10-04',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (107,'박주용','1982-06-18',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (108,'김성윤','1985-05-22',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (109,'곽동준','1984-04-03',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (110,'심정현','1985-08-03',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (111,'이영재','1985-08-15',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (112,'김경환','1985-11-11',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (113,'이상호','1985-09-30',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (114,'김범식','1985-06-02',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (115,'임희섭','1984-11-23',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (116,'전우람','1990-05-28',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (117,'최준호','1984-10-12',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (118,'최지원','1991-12-27',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (119,'김성현','1984-11-20',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (120,'최용재','1986-11-22',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (121,'신성','1986-11-22',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (122,'최동순','1987-12-13',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (123,'김정석','1987-12-14',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (125,'서동익','1987-12-16',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (126,'최광욱','1987-12-17',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (127,'박우열','1987-12-18',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (128,'최현재','1987-12-19',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (129,'이성구','1987-12-20',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (130,'김동현','1987-12-21',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (131,'인기철','1987-12-22',0,1);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (132,'박준범','1987-12-23',0,2);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (133,'김준호','1987-12-24',0,3);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (134,'유형석','1987-12-25',0,4);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (135,'김명준','1987-12-26',0,5);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (136,'김범식','1987-12-27',0,6);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (137,'문원교','1987-12-28',0,7);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (138,'주현호','1987-12-29',0,8);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (139,'홍석승','1987-12-30',0,9);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (140,'이성근','1987-12-31',0,10);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (141,'손영석','1988-01-01',0,11);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (142,'조원준','1988-01-02',0,12);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (143,'변인우','1988-01-03',0,0);
INSERT INTO `player` (`player_id`,`player_name`,`birth`,`pro`,`main_position`) VALUES (144,'윤동현','1988-01-04',0,1);


USE mybaseball;
DESC join_team;
SELECT * FROM join_team;

INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,1,'51');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,2,'0');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,3,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,4,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,5,'9');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,6,'17');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,7,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,8,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (3,9,'1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,10,'19');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,11,'44');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,12,'25');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,13,'13');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,14,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,15,'14');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,16,'23');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,17,'35');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,18,'45');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,19,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,20,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,21,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,22,'32');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,23,'10--1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (4,24,'22');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,25,'61');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,26,'0');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,27,'20');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,28,'1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,29,'28');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,30,'58');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,31,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,32,'3');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,33,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,34,'33');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,35,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,36,'8');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,37,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (5,38,'40');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,39,'1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,40,'68');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,41,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,42,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,43,'13');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,44,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,45,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,46,'82');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,47,'18');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,48,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,49,'44');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,50,'22');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,51,'2');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,52,'21');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,53,'61');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,54,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,55,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (6,56,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,57,'39');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,58,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,59,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,60,'52');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,61,'99');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,62,'41');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,63,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,64,'61');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,65,'8');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,66,'24');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,67,'13');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,68,'50');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,69,'6');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,70,'19');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,71,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,72,'28');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (7,73,'45');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,74,'56');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,75,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,76,'25');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,77,'44');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,78,'3');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,79,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,80,'31');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,81,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,82,'9');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,83,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,84,'77');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,85,'1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,86,'61');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,87,'4');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,88,'11');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,89,'8');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,90,'37');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,91,'20');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,92,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,93,'33');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,94,'22');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,95,'51');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,96,'99');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,97,'10');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,98,'33');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,99,'50');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,100,'2');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,101,'3');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,102,'7');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,103,'8');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,104,'38');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,105,'39');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,106,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,107,'13');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,108,'14');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,109,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,110,'20');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,111,'31');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,112,'34');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,113,'35');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,114,'15');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,115,'45');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,116,'19');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,117,'53');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,118,'56');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,119,'61');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,120,'24');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (2,121,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,122,'51');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,123,'1');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,125,'5');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,126,'8');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,127,'22');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,128,'25');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,129,'29');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,130,'33');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,131,'36');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,132,'37');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,133,'49');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,134,'50');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,135,'53');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,136,'77');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,137,'12');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,138,'17');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,139,'14');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (8,140,'13');
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,141,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,142,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,143,NULL);
INSERT INTO `join_team` (`team_id`,`player_id`,`backnumber`) VALUES (1,144,NULL);

USE mybaseball;
DESC batter_record;
SELECT * FROM batter_record;

INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,86,2,0,0,0,0,0,2,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,142,4,4,1,0,0,0,1,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,80,4,4,1,1,0,0,1,2,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,84,4,3,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,83,4,3,0,2,0,0,2,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,88,4,4,1,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,78,4,3,1,0,0,0,2,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,85,1,0,0,0,0,0,2,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,91,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,76,3,3,1,1,0,0,2,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,79,2,1,1,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,75,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (1,143,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,87,4,4,0,2,0,0,2,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,80,3,1,0,0,0,0,1,1,2,0,0,1,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,76,3,2,2,0,0,0,0,2,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,75,3,1,0,0,0,0,0,0,2,0,0,1,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,78,3,0,0,0,0,0,0,1,3,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,79,3,3,0,0,0,0,0,0,0,3,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,91,3,3,1,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (2,143,3,1,0,0,0,0,1,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,142,4,3,2,1,0,0,3,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,80,4,4,0,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,76,4,3,2,1,0,0,3,2,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,84,4,4,2,0,0,0,1,3,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,83,4,3,1,1,0,0,2,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,143,3,2,1,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,88,3,3,1,0,0,0,2,0,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,86,3,1,1,0,0,0,2,0,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,87,2,2,1,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (3,91,1,1,1,0,0,0,1,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,141,4,2,1,0,0,0,2,0,1,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,76,4,1,0,0,0,0,2,0,3,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,84,4,3,2,0,0,0,2,3,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,83,4,3,1,1,0,0,2,2,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,88,4,3,1,0,0,0,0,1,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,75,3,2,1,0,0,0,1,1,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,78,3,0,0,0,0,0,1,1,2,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,91,3,3,1,1,0,0,1,3,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (4,96,2,1,1,0,0,0,1,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,87,2,1,0,0,0,0,1,0,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,91,2,1,1,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,75,1,1,0,0,0,0,1,1,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,84,1,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,86,1,1,1,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,85,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,76,1,1,0,1,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,142,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,88,1,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (5,96,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,87,4,3,2,0,0,0,1,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,142,4,3,1,0,0,0,0,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,76,4,2,1,0,0,0,0,1,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,83,4,4,2,0,0,0,1,0,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,84,2,2,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,88,4,1,1,0,0,0,1,0,3,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,78,4,4,0,1,0,0,2,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,91,3,3,2,1,0,0,2,0,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,75,3,3,1,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (6,96,2,1,0,0,0,0,0,2,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,142,3,3,1,0,0,0,1,0,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,87,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,76,2,1,0,1,0,0,2,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,141,1,1,0,0,0,0,1,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,84,3,3,0,0,0,0,1,0,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,91,3,2,1,0,0,0,0,3,0,0,0,0,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,80,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,75,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,88,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,143,2,2,1,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,78,1,0,0,0,0,0,0,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (7,96,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,87,3,1,0,0,0,0,2,0,2,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,142,3,3,0,1,0,0,1,2,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,83,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,88,3,3,1,1,0,0,2,1,0,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,76,3,2,0,1,0,0,0,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,91,3,3,2,0,0,0,0,2,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,143,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,80,2,2,0,1,0,0,0,0,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (9,75,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,86,3,3,0,2,0,0,3,0,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,96,3,2,0,0,0,0,1,0,1,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,143,3,3,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,84,3,2,0,1,0,0,2,0,1,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,83,3,3,0,0,0,0,1,2,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,78,3,2,0,0,0,0,1,0,1,0,4,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,88,3,3,0,1,0,0,0,2,0,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,85,3,2,0,0,0,0,1,0,1,2,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (10,91,3,2,0,0,0,0,2,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,87,3,1,1,0,0,0,1,0,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,86,3,3,1,0,0,0,1,1,0,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,142,3,2,0,0,0,0,1,0,1,1,0,0,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,88,3,3,0,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,83,3,3,1,0,0,0,2,2,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,84,3,3,2,0,0,0,1,1,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,76,3,2,0,0,0,0,0,1,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,91,3,3,1,0,0,0,1,2,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (11,78,2,1,1,0,0,0,0,1,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,76,3,2,0,0,0,0,0,0,1,0,0,1,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,142,3,2,0,0,0,0,0,0,1,0,1,1,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,83,3,3,1,0,0,0,0,0,0,0,1,1,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,91,3,3,2,0,0,0,0,0,0,0,2,1,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,84,3,2,0,0,0,0,0,0,1,0,2,2,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,88,3,3,0,0,0,0,0,0,0,0,0,1,2);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,86,3,2,0,0,0,0,0,0,1,0,1,2,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,75,3,1,0,0,0,0,0,0,2,0,0,1,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (12,80,3,3,0,0,0,0,0,0,0,2,0,1,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,87,4,2,0,0,0,0,1,0,2,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,142,4,3,0,0,0,0,1,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,76,4,3,2,0,0,0,2,2,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,88,4,4,0,2,0,0,1,2,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,84,3,3,1,1,0,0,0,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,91,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,75,3,3,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,85,2,2,0,0,0,0,0,0,0,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,78,3,1,0,0,0,0,1,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (13,83,1,0,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,87,6,2,1,0,0,1,4,6,4,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,86,6,3,3,0,0,0,3,3,3,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,83,6,6,1,1,0,0,3,3,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,88,5,3,0,0,0,0,2,3,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,76,5,4,2,0,0,0,3,3,0,0,0,0,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,81,5,3,1,2,0,0,4,1,2,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,75,5,4,2,0,0,0,1,2,1,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,80,5,1,1,0,0,0,2,2,3,0,1,0,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (18,82,5,3,0,0,0,0,2,0,2,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,76,4,2,1,0,0,0,3,0,2,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,86,4,2,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,87,4,3,1,0,0,0,2,4,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,84,4,2,0,0,0,0,0,1,2,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,91,4,3,1,1,0,0,0,2,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,142,4,2,0,0,0,0,0,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,81,4,3,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,88,4,3,1,0,0,0,1,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (15,75,3,2,2,0,0,0,2,1,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,87,3,2,0,0,0,0,1,0,1,2,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,83,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,91,2,0,0,0,0,0,1,0,2,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,84,2,2,0,1,0,0,0,2,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,88,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,76,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,78,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,75,2,1,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (14,92,2,1,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,87,3,3,0,1,0,0,1,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,81,3,3,0,1,0,0,1,2,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,76,3,3,1,1,0,0,2,1,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,86,3,2,0,1,0,0,0,1,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,78,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,75,3,3,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,144,2,0,0,0,0,0,1,0,2,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,96,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (17,92,2,1,0,0,0,0,1,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,76,2,1,0,0,0,0,0,0,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,80,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,86,3,3,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,83,3,3,1,0,0,0,0,0,0,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,81,3,3,1,0,0,0,1,0,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,84,3,1,0,0,0,0,1,0,2,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,91,3,3,2,0,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,78,2,1,0,0,0,0,0,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,90,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,96,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (20,75,2,2,1,0,0,0,0,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,87,3,3,1,0,0,0,1,1,0,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,90,3,1,0,0,0,0,1,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,76,3,3,2,0,0,0,1,2,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,84,3,2,0,0,0,0,1,1,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,83,3,1,0,0,0,0,1,3,2,1,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,81,3,3,0,0,0,0,0,0,0,3,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,75,2,1,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,91,1,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,80,2,1,0,0,0,0,1,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,78,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (21,82,2,2,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,87,4,4,0,1,0,0,1,0,0,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,81,3,2,1,0,0,0,3,0,1,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,86,3,3,1,1,0,0,2,1,0,0,4,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,91,3,2,0,0,0,0,0,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,76,3,3,1,1,0,0,2,0,0,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,84,3,3,0,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,88,3,1,0,0,0,0,0,0,2,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,92,3,2,0,0,0,0,0,0,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (22,80,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,76,5,3,0,0,0,0,4,0,2,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,86,5,3,1,1,0,0,2,1,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,83,5,5,1,0,0,0,1,1,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,84,5,4,1,0,1,0,3,3,1,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,88,4,4,1,1,0,0,0,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,75,4,3,2,0,0,0,0,1,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,80,4,3,0,0,0,0,0,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,92,2,2,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,78,2,2,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (23,82,4,2,1,0,0,0,2,0,2,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,87,4,3,2,0,0,0,1,0,1,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,83,4,3,0,0,0,0,1,1,1,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,78,4,3,0,1,0,0,1,2,1,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,88,3,2,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,75,3,2,0,0,0,0,1,0,1,0,3,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,80,3,2,0,0,1,0,1,1,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,85,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,86,1,1,1,0,0,0,1,1,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,92,3,2,1,0,0,0,2,0,1,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (24,79,3,3,0,0,0,0,0,1,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,87,3,3,1,0,1,1,2,3,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,81,3,2,0,0,0,0,0,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,83,3,3,2,0,0,0,1,0,0,0,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,95,3,2,0,0,0,0,0,0,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,89,3,2,0,0,0,0,1,0,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,92,3,1,0,0,0,0,2,0,2,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,75,2,2,1,0,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,85,2,1,0,0,0,0,2,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,94,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (25,90,2,1,0,0,0,0,1,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,87,4,3,1,0,0,0,1,2,1,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,74,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,81,4,4,2,0,0,0,2,1,0,2,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,83,4,4,2,0,1,0,2,3,0,0,4,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,84,4,2,1,1,0,0,2,1,2,0,5,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,75,1,1,0,0,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,85,3,3,1,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,89,4,4,2,0,0,0,1,3,0,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,92,4,3,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,90,4,4,1,0,0,0,1,0,0,1,2,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (26,82,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,62,3,3,1,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,57,2,2,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,58,2,0,0,0,0,0,0,0,2,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,60,2,1,1,0,0,0,0,1,0,0,0,0,1);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,66,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,65,2,2,1,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,69,2,1,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,61,2,2,1,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,71,2,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,106,3,3,2,0,0,0,2,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,118,3,2,1,1,0,0,2,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,97,3,2,0,1,0,0,3,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,115,3,2,1,0,0,0,0,2,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,116,3,3,2,0,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,103,2,1,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,120,2,2,0,0,0,0,1,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,100,2,2,0,1,0,0,1,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (29,110,2,2,1,0,0,0,0,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,116,3,3,0,1,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,118,3,2,0,1,0,0,1,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,97,2,1,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,106,1,1,0,0,0,0,1,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,115,3,2,0,0,0,0,0,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,99,2,1,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,111,1,1,0,0,0,1,1,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,110,2,2,1,0,0,0,0,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,107,1,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,102,3,1,0,0,0,0,0,0,2,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,100,1,1,1,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,108,2,1,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,103,2,2,0,0,0,0,0,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,15,3,2,0,0,0,0,1,1,1,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,21,3,3,0,0,0,0,0,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,17,3,3,1,1,0,0,1,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,12,3,3,1,0,0,0,2,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,11,3,3,1,1,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,22,3,3,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,14,2,1,0,0,0,0,1,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (31,13,2,2,0,0,0,0,1,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,135,4,4,3,0,0,0,3,4,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,130,4,4,1,1,0,0,3,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,137,4,4,3,0,0,0,3,3,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,122,3,3,3,0,0,0,4,2,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,123,3,2,0,0,0,0,3,1,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,139,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,138,3,3,2,0,0,0,3,2,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,132,3,2,2,0,0,0,4,5,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,134,3,3,1,2,0,0,4,7,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,126,3,3,0,0,0,0,3,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,5,2,2,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,6,2,1,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,4,2,1,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,1,2,2,0,0,0,0,1,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,8,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,3,1,0,0,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,2,1,1,0,0,0,0,0,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,9,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (33,7,1,1,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,32,4,4,0,0,0,0,1,0,0,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,29,3,2,0,0,0,0,0,0,1,2,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,30,3,3,0,1,0,0,1,2,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,28,3,2,0,0,0,0,0,0,1,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,27,3,3,2,0,0,0,2,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,31,3,3,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,38,3,3,0,1,0,0,0,1,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,35,3,1,0,0,0,0,0,1,2,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,36,3,2,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,67,4,3,0,0,0,0,1,0,1,1,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,59,4,4,0,0,0,0,0,0,0,1,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,73,3,3,2,1,0,0,1,1,0,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,60,3,3,1,0,0,0,0,0,0,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,58,3,2,1,0,0,0,0,0,1,0,0,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,68,3,2,0,1,0,0,1,1,1,0,1,0,0);
INSERT INTO `batter_record` (`game_id`,`player_id`,`total_plate`,`at_bat`,`hit`,`hit2`,`hit3`,`hr`,`r`,`rbi`,`bb`,`k`,`sb`,`sac_bunt`,`sac_fly`) VALUES (37,65,3,2,0,0,0,0,0,0,1,0,0,0,0);

SELECT * FROM batter_record;
SHOW tables;
SELECT league_year AS '연도', league_name AS '리그명' FROM league WHERE league_id = 1;

SELECT * from participate p INNER JOIN game g
	ON p.league_id = g.league_id AND p.team_id = g.hometeam
WHERE p.league_id = 1;

SELECT * from participate p INNER JOIN game g
	ON p.league_id = 1 AND p.league_id = g.league_id AND p.team_id = g.awayteam;
    
    
SELECT * from participate p INNER JOIN game g
	ON p.league_id = g.league_id AND (p.team_id = g.awayteam OR p.team_id = g.hometeam)
WHERE p.league_id = 1;

SELECT * FROM game WHERE league_id = 1;

SELECT game_id, l.league_id AS league_id, l.league_name AS league_name, round, gameday, th.team_name AS home, ta.team_name AS away, result, hscore, ascore 
FROM game g, team th, team ta , league l
WHERE g.hometeam = th.team_id AND g.awayteam = ta.team_id AND g.league_id = l.league_id;

SELECT * FROM show_games where league_id = 1;

(SELECT count(result) AS win , h_id, home FROM show_games where league_id = 1 AND result = '승' group by h_id);
(SELECT count(result) AS win , a_id, away FROM show_games where league_id = 1 AND result = '패' group by a_id);

SELECT * FROM game;
SELECT * FROM participate;
DELETE FROM participate WHERE league_id = 1 AND team_id = 18;
SELECT * FROM team;

USE mybaseball;
(SELECT game_id, league_name, round, gameday, home, away, result, hscore, ascore 
FROM show_games 
WHERE h_id = 2)
UNION ALL
(SELECT game_id, league_name, round, gameday, home, away, IF(result = '승', '패', if(result = '무', '무', '승')), hscore, ascore 
FROM show_games 
WHERE a_id = 2);

SELECT * FROM team WHERE team_id = 1;

SELECT team_name,  COALESCE(win.`승`,0) as `승` ,COALESCE(draw.`무`,0) as `무` , COALESCE(lose.`패`,0) as `패` , COALESCE(win.`승`,0)/(COALESCE(lose.`패`,0)+COALESCE(win.`승`,0)+COALESCE(draw.`무`,0)) AS 승률 
FROM ( 
	(SELECT * FROM participate WHERE league_id = league_number) as p
    LEFT JOIN 
		team as t
	ON p.team_id = t.team_id
    LEFT JOIN 
		(
		SELECT SUM(win) as '승', t_id FROM (
			(SELECT count(*) as win, awayteam as t_id FROM game WHERE league_id = league_number AND result = '패' group by awayteam)
			UNION ALL
			(SELECT count(*) as win, hometeam as t_id FROM game WHERE league_id = league_number AND result = '승' group by hometeam)
			) AS w
		GROUP BY t_id
		) as win
	ON p.team_id = win.t_id
	LEFT JOIN 
		(
		SELECT SUM(win) as '무', t_id FROM (
			(SELECT count(*) as win, awayteam as t_id FROM game WHERE league_id = league_number AND result = '무' group by awayteam)
			UNION ALL
			(SELECT count(*) as win, hometeam as t_id FROM game WHERE league_id = league_number AND result = '무' group by hometeam)
			) AS d
		GROUP BY t_id
		) as draw
	ON p.team_id = draw.t_id
    LEFT JOIN 
		(
		SELECT SUM(lose) as '패', t_id  FROM (
			(SELECT count(*) as lose, awayteam as t_id FROM game WHERE league_id = league_number AND result = '승' group by awayteam)
			UNION ALL
			(SELECT count(*) as lose, hometeam as t_id FROM game WHERE league_id = league_number AND result = '패' group by hometeam)
			) AS w
		GROUP BY t_id
		) as lose
	ON p.team_id = lose.t_id
    )
ORDER BY `승률` DESC;
