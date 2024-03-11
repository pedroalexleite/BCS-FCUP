CREATE DATABASE IF NOT EXISTS CS;
USE CS;
DROP TABLE IF EXISTS TEAMS, ACHIEVEMENTS, PLAYERS, STATS,TEAM_TOURNAMENT,PLAYER_TOURNAMENT,BRANDS,BRANDS_SPONSOR_TEAM,TOURNAMENTS,WEAPONS;

CREATE TABLE
TEAMS
(
  Name         VARCHAR(64) NOT NULL PRIMARY KEY,
  Initials     VARCHAR(5),
  Ranking      INT NOT NULL,
  Average_age  FLOAT NOT NULL,
  Base         VARCHAR(64),
  Region       VARCHAR(32)
);

CREATE TABLE
WEAPONS
(
  Name              VARCHAR(64) NOT NULL PRIMARY KEY,
  Damage            INT NOT NULL,
  Price             INT NOT NULL,
  Price_per_kill    FLOAT NOT NULL,
  Type              VARCHAR(64)
);

/* Relacao 1:N entre TEAM e PLAYERS, 1 equipa pode ter mais do que 1 jogador, mas 1 jogador so pode ter 1 equipa */
/* Relacao 1:N entre PLAYERS e WEAPONS, 1 jogador tem uma arma favorita, mas uma arma pode ter mais doque 1 jogador */
CREATE TABLE 
PLAYERS
(
  Id        INT PRIMARY KEY AUTO_INCREMENT,
  Name      VARCHAR(128) NOT NULL,
  Nickname  VARCHAR(64) NOT NULL,
  Country   VARCHAR(64) NOT NULL,
  Birthdate DATE NOT NULL,
  Age 		INT NOT NULL,
  Team      VARCHAR(64),
  Fav_gun   VARCHAR(64),
  FOREIGN KEY(Team) REFERENCES TEAMS(Name) ON DELETE CASCADE,
  FOREIGN KEY(Fav_gun) REFERENCES WEAPONS(Name) ON DELETE CASCADE
); 

/* Composto */
CREATE TABLE
STATS
(
	ID INT PRIMARY KEY,
    Rating FLOAT NOT NULL,
    Dpr FLOAT NOT NULL,
    Kast FLOAT NOT NULL,
    Impact FLOAT NOT NULL,
    Adr FLOAT NOT NULL,
    Kpr FLOAT NOT NULL,
    FOREIGN KEY(ID) REFERENCES PLAYERS(Id) ON DELETE CASCADE
);

/* Multi valor */
CREATE TABLE
ACHIEVEMENTS
(
 idPlayer    INT NOT NULL,
 Achievement VARCHAR(250),
 FOREIGN KEY(idPlayer) REFERENCES PLAYERS(Id) ON DELETE CASCADE
);

/* Relacao M:N entre TEAM e TOURNAMENTS, muitas equipa pode ir a muitos torneios, e muitos torneios podem ter muitas equipas */
CREATE TABLE
TOURNAMENTS
( 
	Name VARCHAR(128) NOT NULL PRIMARY KEY,
    Organizer VARCHAR(64) NOT NULL,
    Location VARCHAR(64) NOT NULL,
    Datestart DATE NOT NULL,
    Dateend DATE NOT NULL,
    Status VARCHAR(32) NOT NULL,
    Prize DOUBLE NOT NULL,
    Winner VARCHAR(32), 
    FOREIGN KEY(Winner) REFERENCES TEAMS(Name) ON DELETE CASCADE
);


/* Relacao M:N entre TEAM e TOURNAMENTS, muitas equipa pode ir a muitos torneios, e muitos torneios podem ter muitas equipas */
CREATE TABLE
TEAM_TOURNAMENT
( 
	Name_team VARCHAR(64) NOT NULL,
    Name_tournament  VARCHAR(128) NOT NULL,
    PRIMARY KEY(Name_tournament,Name_team),
    FOREIGN KEY(Name_team) REFERENCES TEAMS(Name) ON DELETE CASCADE,
    FOREIGN KEY(Name_tournament) REFERENCES TOURNAMENTS(Name) ON DELETE CASCADE
);	

/* Relacao M:N entre PLAYERS e TOURNAMENTS, muitos jogadores podem ir a muitos torneios, e muitos torneios podem ter muitos jogadores, e com o rating do jogador nesse torneio */
CREATE TABLE 
PLAYER_TOURNAMENT
(
	Id_player INT NOT NULL,
    Name_tournament VARCHAR(128) NOT NULL,
    Rating FLOAT NOT NULL,
    PRIMARY KEY(Name_tournament,Id_player),
	FOREIGN KEY(Id_player) REFERENCES PLAYERS(Id) ON DELETE CASCADE,
	FOREIGN KEY(Name_tournament) REFERENCES TOURNAMENTS(Name) ON DELETE CASCADE
);

CREATE TABLE 
BRANDS
(
	Name VARCHAR(64) PRIMARY KEY NOT NULL,
    Ceo VARCHAR(128) NOT NULL,
    Location VARCHAR(64) NOT NULL,
    Market VARCHAR(64) NOT NULL
);

/* Relacao M:N entre BRANDS e TEAMS, muitas equipas podem ter muitos patrocionios, e muitos patrocionios podem ter muitas equipas */
CREATE TABLE 
 BRANDS_SPONSOR_TEAM
(
   Name_team VARCHAR(64) NOT NULL,
   Name_brand VARCHAR(64) NOT NULL,
   PRIMARY KEY(Name_team,Name_brand), 
   FOREIGN KEY(Name_team) REFERENCES TEAMS(Name) ON DELETE CASCADE,
   FOREIGN KEY(Name_brand) REFERENCES BRANDS(Name) ON DELETE CASCADE
);

INSERT INTO
  TEAMS(Name,Initials,Ranking,Average_age,Base,Region)
 VALUES
  ('Navi','NVI',1,22.8,'RUSSIA','CIS'),
  ('Astralis','AST',2,25.6,'DENMARK','Europe'),
  ('Gambit','GMB',3,21.2,'RUSSIA','CIS'),
  ('Virtus.pro','VP',4,22.2,'RUSSIA','CIS'),
  ('Liquid','TL',5,24.1,'UNITED STATES','NA');

INSERT INTO
  WEAPONS(Name,Damage,Price,Price_per_kill,Type)
VALUES
   ('M4A4', 33, 3100, 300, 'Rifle'),
   ('M4A1-S', 33, 2900, 300, 'Rifle'),
   ('AK-47', 36, 2700, 300, 'Rifle'),
   ('AWP', 115, 4750, 100, 'Sniper'),
   ('SSG553', 30, 3000, 300, 'Rifle'),
   ('AUG', 28, 3300, 300, 'Rifle'),
   ('USP-S', 35, 200, 300, 'Pistol'),
   ('Glock-18', 30, 200, 300, 'Pistol'),
   ('P2000', 35, 200, 300, 'Pistol'),
   ('Desert Eagle', 63, 700, 300, 'Pistol'),
   ('SSG08', 88, 1700, 300, 'Sniper'),
   ('Scar-20', 80, 5000, 300, 'Sniper'),
   ('G3SG1', 79, 5000, 300, 'Sniper'),
   ('P90', 25, 2350, 300, 'SMG'),
   ('MP9', 26, 1250, 600, 'SMG'),
   ('MAC-10', 28, 1050, 600, 'SMG'),
   ('MAG-7', 30, 1300, 900, 'Shotgun'),
   ('XM1014', 20, 2000, 900, 'Shotgun');


INSERT INTO
  PLAYERS(Id,Name,Nickname,Country,Birthdate,Age,Team,Fav_gun)
VALUES
 (1,'Egor Vasilyev','flamie','RUSSIA','1997-4-5',24,'Navi','AUG'),
 (2,'Aleksandr Kostyliev','s1mple','UKRAINE','1997-10-2',23,'Navi','AWP'),
 (3,'Denis Sharipov','electronic','RUSSIA','1998-9-2',22,'Navi','M4A4'),
 (4,'Kirill Mikhailov','Boombl4','RUSSIA','1998-12-20',22,'Navi','MAC-10'),
 (5,'Ilya Zalutskiy','Perfecto','RUSSIA','1999-11-24',21,'Navi','AK-47'),

 (6,'Andreas Højsleth','Xyp9x','DENMARK','1995-9-11',25,'Astralis','AUG'),
 (7,'Peter Rasmussen','dupreeh','DENMARK','1993-3-26',28,'Astralis','AK-47'),
 (8,'Nicolai Reedtz','device','DENMARK','1995-9-8',25,'Astralis','AWP'),
 (9,'Lukas Rossander','gla1ve','DENMARK','1995-6-7',25,'Astralis','M4A4'),
 (10,'Emil Reif','Magisk','DENMARK','1998-3-5',23,'Astralis','AK-47'),

 (11,'Sergey Rykhtorov','Ax1Le','RUSSIA','2002-4-29',18,'Gambit','AK-47'),
 (12,'Abay Khasenov','Hobbit','KAZAKHSTAN','1994-5-18',26,'Gambit','AK-47'),
 (13,'Timofey Yakushin','interz','RUSSIA','2000-8-4',20,'Gambit','AK-47'),
 (14,'Vladislav Gorshkov','nafany','RUSSIA','2001-6-15',19,'Gambit','Glock-18'),
 (15,'Dmitry Sokolov','sh1ro','RUSSIA','2001-7-15',19,'Gambit', 'AWP'),

 (16,'Timur Tulepov','buster','KAZAKHSTAN','1999-12-17',21,'Virtus.pro','M4A4'),
 (17,'Dzhami Ali','Jame','RUSSIA','1998-8-23',22,'Virtus.pro','AWP'),
 (18,'Alexey Golubev','Qikert','KAZAKHSTAN','1999-1-1',22,'Virtus.pro','AK-47'),
 (19,'Sanjar Kuliev','SANJI','UZBEKISTAN','1998-11-18',23,'Virtus.pro','MAC-10'),
 (20,'Mareks Gaļinskis','YEKINDAR','LATVIA','1999-10-4',21,'Virtus.pro','AK-47'),

 (21,'Jonathan Jablonowski','EliGE','UNITED STATES','1997-7-16',23,'Liquid','SSG553'),
 (22,'Keith Markovic','NAF','CANADA','1997-11-24',23,'Liquid','AWP'),
 (23,'Jake Yip','Stewie2K','UNITED STATES','1998-1-7',23,'Liquid','AWP'),
 (24,'Michael Wince','Grim','UNITED STATES','2000-11-22',20,'Liquid','AK-47'),
 (25,'Gabriel Toledo','FalleN','BRAZIL','1991-5-30',29,'Liquid','AWP');
 
INSERT INTO
  ACHIEVEMENTS(idPlayer,Achievement)
VALUES
 (1, 'MVP DreamHack ZOWIE Open Leipzig 2016'),
 (1, 'MVP ESEA Pro League Season 2 Finals'),
 (2, 'MVP BLAST Premier Global Final 2020'),
 (2, 'MVP ESL Pro league Season 12 Europe'),
 (2, 'MVP IEM Katowice 2020'),
 (2, 'MVP StarSeries i-League Season 7'),
 (2, 'MVP BLAST Pro Series Copenhagen 2018'),
 (2, 'MVP ESL One Cologne 2018'),
 (2, 'MVP CS:GO Asia Championships 2018'),
 (2, 'MVP StarSeries i-League Season 5'),
 (2, 'MVP DreamHack Masters Marseille 2018'),
 (2, 'MVP StarSeries i-League Season 4'),
 (2, 'MVP DreamHack Open Winter 2017'),
 (2, 'MVP ESL One New York 2016'),
 (3, 'MVP ICE Challenge 2020'),
 (6, 'MVP IEM Katowice 2017'),
 (7, 'MVP BLAST Pro Series Global Final 2019'),
 (7, 'MVP ESL Pro League Season 7 Finals'),
 (8, 'MVP IEM Global Challenge 2020'),
 (8, 'MVP DreamHack Masters Winter 2020 Europe'),
 (8, 'MVP ESL One:Road to Rio - Europe'),
 (8, 'MVP ECS Season 8 Finals'),
 (8, 'MVP Starladder Major Berlin 2019'),
 (8, 'MVP BLAST Pro Series São Paulo 2019'),
 (8, 'MVP ESL Pro League Season 8 Finals'),
 (8, 'MVP ECS Season 6 Finals'),
 (8, 'MVP IEM Chicago 2018'),
 (8, 'MVP BLAST Pro Series Istanbul 2018'),
 (8, 'MVP FACEIT Major 2018'),
 (8, 'MVP ELEAGUE CS:FO Premier 2018'),
 (8, 'MVP ECS Season 5 Finals'),
 (8, 'MVP ECS Season 2 Finals'),
 (8, 'MVP PGL Season 1 Finals'),
 (8, 'MVP FACEIT League 2016 Stage 2 Finals at Dreamhack Valencia'),
 (8, 'MVP Fragbite Masters Season 4 Finals'),
 (8, 'MVP CCS Kick-off Season Finals'),
 (9, 'MVP IEM Beijing 2019'),
 (10, 'MVP IEM Katowice 2019'),
 (10, 'MVP BLAST Pro Series Lisbon 2018'),
 (12, 'MVP DreamHack ZOWIE Open Winter 2016'),
 (15, 'MVP IEM Katowice 2021'),
 (17, 'MVP cs_summit 7'),
 (17, 'MVP BLAST Pro Series Moscow 2019'),
 (21, 'MVP ESL Pro League Season 11 North America'),
 (21, 'MVP IEM Chicago 2019'),
 (21, 'MVP ESL Pro League Season 9 Finals'),
 (21, 'MVP DreamHack Masters Dallas 2019'),
 (22, 'MVP BLAST Pro Series Los Angeles 2019'),
 (22, 'MVP iBUYPOWER Masters 2019'),
 (22, 'MVP SuperNova CS:GO Malta'),
 (22, 'MVP cs_summit 2'),
 (22, 'MVP SL i-League Invitational Shanghai 2017'),
 (23, 'MVP iBUYPOWER Masters 2017'),
 (23, 'MVP DreamHack Open Denver 2017'),
 (25, 'MVP ZOTAC Cup Masters 2018 Grand Finals'),
 (25, 'MVP BLAST Pro Series Copenhagen 2017'),
 (25, 'MVP ESL One Cologne 2017'),
 (25, 'MVP DreamHack Austin 2016');
 
 INSERT INTO
   BRANDS(Name,Ceo,Location,Market)
 VALUES
  ('Audi','Markus Duesmann','Germany', 'Automobile'),
  ('Parimatch','Sergey Portnov','Cyprus','Betting'),
  ('Alienware','Michael Dell', 'USA', 'Technology'),
  ('Logitech', 'Bracken Darrell', 'USA', 'Technology'),
  ('HyperX', 'John Tu', 'USA', 'Technology'),
  ('HP', 'William Redington Hewlett', 'USA', 'Technology'),
  ('Hummel', 'Ludwig Messmer', 'Denmark', 'Sportswear');
 
  INSERT INTO 
	TOURNAMENTS(Name,Organizer,Location,Datestart,Dateend,Status,Prize,Winner)
  VALUES
    ('Intel Extreme Masters Season XV - World Championship','ESL','Katowice','2021-02-16','2021-02-28','FINISHED',1000000,'Gambit'),
    ('ELEAGUE Major: Atlanta 2017', 'ELEAGUE','Atlanta','2017-01-22', '2017-01-29','FINISHED',1000000,'Astralis'),
    ('BLAST Pro Series: Global Final 2019', 'RFRSH', 'Riffa', '2019-12-12', '2019-12-14','FINISHED', 500000, 'Astralis');
    
	INSERT INTO
	  TEAM_TOURNAMENT(Name_team, Name_tournament) 
	VALUES
	  ('Astralis', 'Intel Extreme Masters Season XV - World Championship'),
	  ('Navi', 'Intel Extreme Masters Season XV - World Championship'),
	  ('Liquid', 'Intel Extreme Masters Season XV - World Championship'),
	  ('Gambit', 'Intel Extreme Masters Season XV - World Championship'),
	  ('Virtus.pro', 'Intel Extreme Masters Season XV - World Championship'),
	  ('Astralis', 'ELEAGUE Major: Atlanta 2017'),
	  ('Navi', 'ELEAGUE Major: Atlanta 2017'),
	  ('Liquid', 'ELEAGUE Major: Atlanta 2017'),
	  ('Gambit', 'ELEAGUE Major: Atlanta 2017'),
	  ('Virtus.pro', 'ELEAGUE Major: Atlanta 2017'),
      ('Astralis', 'BLAST Pro Series: Global Final 2019'),
      ('Liquid', 'BLAST Pro Series: Global Final 2019');
  
INSERT INTO
  PLAYER_TOURNAMENT(Id_player,Name_tournament,Rating)
 VALUES
   (1, 'Intel Extreme Masters Season XV - World Championship', 0.98),
   (2, 'Intel Extreme Masters Season XV - World Championship', 1.21),
   (3, 'Intel Extreme Masters Season XV - World Championship', 1.07),
   (4, 'Intel Extreme Masters Season XV - World Championship', 1.0),
   (5, 'Intel Extreme Masters Season XV - World Championship', 1.02),
   (6, 'Intel Extreme Masters Season XV - World Championship', 0.99),
   (7, 'Intel Extreme Masters Season XV - World Championship', 1.13),
   (8, 'Intel Extreme Masters Season XV - World Championship', 1.18),
   (9, 'Intel Extreme Masters Season XV - World Championship', 1.01),
   (10, 'Intel Extreme Masters Season XV - World Championship', 1.04),
   (11, 'Intel Extreme Masters Season XV - World Championship', 1.17),
   (12, 'Intel Extreme Masters Season XV - World Championship', 1.12),
   (13, 'Intel Extreme Masters Season XV - World Championship', 0.97),
   (14, 'Intel Extreme Masters Season XV - World Championship', 1.04),
   (15, 'Intel Extreme Masters Season XV - World Championship', 1.27),
   (16, 'Intel Extreme Masters Season XV - World Championship', 1.08),
   (17, 'Intel Extreme Masters Season XV - World Championship', 1.17),
   (18, 'Intel Extreme Masters Season XV - World Championship', 1.02),
   (19, 'Intel Extreme Masters Season XV - World Championship', 0.97),
   (20, 'Intel Extreme Masters Season XV - World Championship', 1.23),
   (21, 'Intel Extreme Masters Season XV - World Championship', 1.20),
   (22, 'Intel Extreme Masters Season XV - World Championship', 1.16),
   (23, 'Intel Extreme Masters Season XV - World Championship', 1.01),
   (24, 'Intel Extreme Masters Season XV - World Championship', 1.01),
   (25, 'Intel Extreme Masters Season XV - World Championship', 1.05),
   (1, 'ELEAGUE Major: Atlanta 2017', 1.05),
   (2, 'ELEAGUE Major: Atlanta 2017', 1.16),
   (3, 'ELEAGUE Major: Atlanta 2017', 1.12),
   (4, 'ELEAGUE Major: Atlanta 2017', 1.02),
   (5, 'ELEAGUE Major: Atlanta 2017', 1.01),
   (6, 'ELEAGUE Major: Atlanta 2017', 1.06),
   (7, 'ELEAGUE Major: Atlanta 2017', 1.17),
   (8, 'ELEAGUE Major: Atlanta 2017', 1.19),
   (9, 'ELEAGUE Major: Atlanta 2017', 1.03),
   (10, 'ELEAGUE Major: Atlanta 2017', 1.20),
   (11, 'ELEAGUE Major: Atlanta 2017', 1.06),
   (12, 'ELEAGUE Major: Atlanta 2017', 1.10),
   (13, 'ELEAGUE Major: Atlanta 2017', 0.95),
   (14, 'ELEAGUE Major: Atlanta 2017', 1.06),
   (15, 'ELEAGUE Major: Atlanta 2017', 1.15),
   (16, 'ELEAGUE Major: Atlanta 2017', 1.09),
   (17, 'ELEAGUE Major: Atlanta 2017', 1.14),
   (18, 'ELEAGUE Major: Atlanta 2017', 1.09),
   (19, 'ELEAGUE Major: Atlanta 2017', 0.92),
   (20, 'ELEAGUE Major: Atlanta 2017', 1.16),
   (21, 'ELEAGUE Major: Atlanta 2017', 1.19),
   (22, 'ELEAGUE Major: Atlanta 2017', 1.17),
   (23, 'ELEAGUE Major: Atlanta 2017', 1.10),
   (24, 'ELEAGUE Major: Atlanta 2017', 0.95),
   (25, 'ELEAGUE Major: Atlanta 2017', 1.16),
   (6, 'BLAST Pro Series: Global Final 2019', 1.12),
   (7, 'BLAST Pro Series: Global Final 2019', 1.07),
   (8, 'BLAST Pro Series: Global Final 2019', 1.15),
   (9, 'BLAST Pro Series: Global Final 2019', 1.08),
   (10, 'BLAST Pro Series: Global Final 2019', 1.10),
   (21, 'BLAST Pro Series: Global Final 2019', 1.16),
   (22, 'BLAST Pro Series: Global Final 2019', 1.09),
   (23, 'BLAST Pro Series: Global Final 2019', 0.98),
   (24, 'BLAST Pro Series: Global Final 2019', 0.92),
   (25, 'BLAST Pro Series: Global Final 2019', 1.02);
   
INSERT INTO
  BRANDS_SPONSOR_TEAM(Name_team,Name_brand)
VALUES
   ('Navi', 'Parimatch'),
   ('Navi','HyperX'),
   ('Liquid','Alienware'),
   ('Liquid','HyperX'),
   ('Astralis', 'Logitech'),
   ('Astralis', 'HP'),
   ('Astralis', 'Hummel'),
   ('Astralis', 'Audi'),
   ('Gambit', 'Parimatch'),
   ('Virtus.pro', 'Parimatch'),
   ('Virtus.pro', 'HP');

INSERT INTO
  STATS(ID,Rating ,Dpr,Kast,Impact,Adr,Kpr)
VALUES
	(1,1.03,0.66,0.707,1.01,75.6,0.70),
	(2,1.24,0.64,0.737,1.35,86.1,0.85),
	(3,1.10,0.66,0.718,1.20,83.3,0.75),
	(4,1.06,0.69,0.686,1.13,77.7,0.69),
	(5,1.03,0.62,0.722,0.89,71.0,0.63),
	(6,1.03,0.61,0.728,1.0,76.0,0.67),
	(7,1.09,0.65,0.719,1.16,78.0,0.74),
	(8,1.17,0.62,0.714,1.29,80.7,0.78),
	(9,1.0,0.65,0.707,1.07,75.9,0.67),
	(10,1.09,0.63,0.731,1.13,80.1,0.73),
	(11,1.15,0.63,0.723,1.13,79.8,0.72),
	(12,1.06,0.66,0.712,1.11,79.8,0.72),
	(13,1.0,0.59,0.733,0.82,63.9,0.59),
	(14,1.04,0.69,0.693,1.08,74.4,0.67),
	(15,1.26,0.54,0.761,1.22,79.5,0.77),
	(16,1.10,0.62,0.725,1.06,74.6,0.69),
	(17,1.18,0.55,0.738,1.14,73.9,0.72),
	(18,1.13,0.64,0.723,1.11,78.6,0.72),
	(19,0.99,0.66,0.689,0.93,69.9,0.62),
	(20,1.14,0.69,0.69,1.29,82.9,0.75),
	(21,1.09,0.68,0.713,1.25,83.7,0.76),
	(22,1.09,0.63,0.732,1.11,81.4,0.73),
	(23,1.02,0.68,0.707,1.17,78.2,0.70),
	(24,1.12,0.68,0.721,1.14,79.4,0.73),
	(25,1.08,0.60,0.72,1.10,72.5,0.70);
