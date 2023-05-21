-- Pablo Bolio Pradilla - A01782428

SET NAMES utf8mb4; 
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



DROP SCHEMA IF EXISTS wkfTournament;
CREATE SCHEMA wkfTournament;
USE wkfTournament;





CREATE TABLE medals (
	medal_name VARCHAR(10) NOT NULL,
    PRIMARY KEY (medal_name)
);


CREATE TABLE country(
	country_name VARCHAR(20) NOT NULL,
	number_of_participants TINYINT UNSIGNED NOT NULL DEFAULT 0, 
    number_of_medals TINYINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (country_name)
);


CREATE TABLE athletes(
	athlete_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    athlete_name VARCHAR(20) NOT NULL,
    athlete_surnames VARCHAR(50) NOT NULL,
    sex VARCHAR(15) NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    PRIMARY KEY (athlete_id),
    CONSTRAINT fk_country_athletes FOREIGN KEY (nationality) REFERENCES country (country_name) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE discipline(
	discipline_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    discipline_name VARCHAR(50),
    general_discipline VARCHAR(20),
	PRIMARY KEY (discipline_id)
);


CREATE TABLE rankings(
	placing TINYINT UNSIGNED NOT NULL,
	PRIMARY KEY (placing)
);


CREATE TABLE competition(
	competition_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    competition_discipline TINYINT UNSIGNED NOT NULL,
    competition_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    location VARCHAR(25) NOT NULL,
    registered_athletes TINYINT UNSIGNED NOT NULL DEFAULT 0, 
	competition_type VARCHAR(25),
    points_awarded TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (competition_id),
    CONSTRAINT fk_discipline_competition FOREIGN KEY (competition_discipline) REFERENCES discipline (discipline_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE placings(
	athlete_id TINYINT UNSIGNED NOT NULL,
    competition_id TINYINT UNSIGNED NOT NULL,
    medal_name VARCHAR(10) NOT NULL,
    placing TINYINT UNSIGNED NOT NULL,
    CONSTRAINT fk_athletes_placings FOREIGN KEY (athlete_id) REFERENCES athletes (athlete_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_competition_placings FOREIGN KEY (competition_id) REFERENCES competition (competition_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_medals_placings FOREIGN KEY (medal_name) REFERENCES medals (medal_name) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ranking_placings FOREIGN KEY (placing) REFERENCES ranking (placing) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE results(
	medal_name VARCHAR(10) NOT NULL,
    country_id VARCHAR(20) NOT NULL,
	athlete_id TINYINT UNSIGNED NOT NULL,
	discipline_id TINYINT UNSIGNED NOT NULL,
	CONSTRAINT fk_medals_results FOREIGN KEY (medal_name) REFERENCES medals (medal_name) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_country_results FOREIGN KEY (country_id) REFERENCES country (country_name) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_athletes_results FOREIGN KEY (athlete_id) REFERENCES athletes (athlete_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_discipline_results FOREIGN KEY (discipline_id) REFERENCES discipline (discipline_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

SHOW TABLES;

-- Enable restrictions
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;








INSERT INTO wkfTournament.medals SET medal_name = ('gold');
INSERT INTO wkfTournament.medals SET medal_name = ('silver');
INSERT INTO wkfTournament.medals SET medal_name = ('bronze');




INSERT INTO wkfTournament.country SET country_name = ('Mexico');
INSERT INTO wkfTournament.country SET country_name = ('USA');
INSERT INTO wkfTournament.country SET country_name = ('Colombia');
INSERT INTO wkfTournament.country SET country_name = ('Italy');





INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Juan', 'Perez Maldonado', 'male', 'Mexico');
INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Maria', 'Pradilla Patiño', 'female', 'Colombia');
INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Dan', 'Reynolds', 'male', 'USA');
INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Francisco', 'Garcia de los Reyes', 'male', 'Colombia');
INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Carola', 'Boticcelli Alvarez', 'female', 'Italy');
INSERT INTO wkfTournament.athletes (athlete_name, athlete_surnames, sex, nationality) VALUES ('Ximena', 'Padilla Corona', 'female', 'Mexico');



INSERT INTO wkfTournament.discipline (discipline_id, discipline_name, general_discipline) VALUES (1,'Kata Male', 'Karate');
INSERT INTO wkfTournament.discipline (discipline_id, discipline_name, general_discipline) VALUES (2,'Kumite Male', 'Karate');
INSERT INTO wkfTournament.discipline (discipline_id, discipline_name, general_discipline) VALUES (3,'Kata Female', 'Karate');
INSERT INTO wkfTournament.discipline (discipline_id, discipline_name, general_discipline) VALUES (4,'Kumite Female', 'Karate');




INSERT INTO wkfTournament.rankings VALUES (1);
INSERT INTO wkfTournament.rankings VALUES (2);
INSERT INTO wkfTournament.rankings VALUES (3);
INSERT INTO wkfTournament.rankings VALUES (4);
INSERT INTO wkfTournament.rankings VALUES (5);





INSERT INTO wkfTournament.competition (competition_discipline, competition_date, location, registered_athletes, competition_type, points_awarded) VALUES (1, NOW(), 'New York', 3, 'Demonstration', 50);
INSERT INTO wkfTournament.competition (competition_discipline, competition_date, location, registered_athletes, competition_type, points_awarded) VALUES (2, NOW(), 'Brasilia', 3, 'Combat', 70);
INSERT INTO wkfTournament.competition (competition_discipline, competition_date, location, registered_athletes, competition_type, points_awarded) VALUES (3, NOW(), 'Bogota', 3, 'Combat', 50);
INSERT INTO wkfTournament.competition (competition_discipline, competition_date, location, registered_athletes, competition_type, points_awarded) VALUES (4, NOW(), 'CDMX', 3, 'Demonstration', 80);




INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (1, 1, 'gold', 1);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (1, 2, 'silver', 2);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (2, 3, 'silver', 2);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (2, 4, 'silver', 2);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (3, 1, 'bronze', 3);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (3, 2, 'bronze', 3);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (4, 1, 'silver', 2);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (4, 2, 'gold', 1);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (5, 3, 'gold', 1);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (5, 4, 'bronze', 3);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (6, 3, 'bronze', 3);
INSERT INTO wkfTournament.placings (athlete_id, competition_id, medal_name, placing) VALUES (6, 4, 'gold', 1);





INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('gold', 'Mexico', 1, 1);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('silver', 'Mexico', 1, 2);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('silver', 'USA', 2, 3);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('silver', 'USA', 2, 4);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('bronze', 'Colombia', 3, 1);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('bronze', 'Colombia', 3, 2);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('silver', 'Italy', 4, 1);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('gold', 'Italy', 4, 2);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('gold', 'Colombia', 5, 3);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('bronze', 'Colombia', 5, 4);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('bronze', 'Mexico', 6, 3);
INSERT INTO wkfTournament.results (medal_name, country_id, athlete_id, discipline_id) VALUES ('gold', 'Mexico', 6, 4);