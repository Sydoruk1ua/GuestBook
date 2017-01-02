#Script to create the database
CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(25) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `phoneNumber` VARCHAR(15) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_general_ci;

#Requests to fill the database with test data
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Nataliya', 'Trach', '1969-10-23', '(012)345-6789', 'Ukraine', 'Kiev');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Sasha', 'Rainin', '1970-8-5', '(097)357-3901', 'Russia', 'Moscow');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Kola', 'Granovsky', '1971-7-18', '(067)852-0236', 'USA', 'Washington');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Andrey', 'Vovk', '1993-6-30', '(097)847-0349', 'Great Britain', 'London');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Jack', 'Kistion', '1992-5-27', '(098)634-1504', 'Polish', 'Cracow');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Bob', 'Stets', '2003-12-11', '(097)968-0597', 'Ukraine', 'Rivne');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Jim', 'Lozhkin', '1976-4-12', '(067)874-3606', 'Great Britain', 'London');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Ира', 'Петренко', '1985-10-13', '(097)964-4507', 'Ukraine', 'Lviv');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Luda', 'Svyrydenko', '1988-11-14', '(098)226-0869', 'Ukraine', 'Kiev');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Natasha', 'Vlasova', '1986-1-15', '(659)965-5809', 'USA', 'Washington');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Max', 'Hryniv', '1979-2-9', '(093)112-3610', 'Ukraine', 'Lviv');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Alex', 'Smith', '1980-8-8', '(097)987-4711', 'Polish', 'Cracow');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Jon', 'Black', '1981-10-7', '(916)467-5812', 'Russia', 'Saint Petersburg');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Jon', 'White', '1999-4-4', '(097)964-6913', 'Ukraine', 'Kiev');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Петро', 'Петренко', '2001-5-3', '(097)000-7914', 'Ukraine', 'Ternopil');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('George', 'King', '1995-7-1', '(097)890-8915', 'Great Britain', 'London');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Stefan', 'Korniev', '1987-9-16', '(097)375-1699', 'Ukraine', 'Kiev');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Jon', 'Smith', '1917-10-17', '(916)411-7100', 'Russia', 'Saint Petersburg');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Maria', 'Birukova', '1983-3-27', '(659)693-1837', 'USA', 'Washington');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Іван', 'Іванов', '1977-1-28', '(097)974-5689', 'Ukraine', 'Vinnytsia');
INSERT INTO user (firstName, lastName, birthday, phoneNumber, country, region) VALUES ('Bill', 'Kovensky', '1984-6-29', '(659)864-1338', 'USA', 'Washington');