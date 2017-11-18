CREATE DATABASE `movies_tonight`;
USE `movies_tonight`;
#Create Strong Tables First
#Create Theater Table 
CREATE TABLE `THEATER`(
			TheaterID	Int(11)				Not NULL auto_increment ,
            TName		varchar(50)			Default Null,
            Location	varchar(50)			Default Null,
            Phone		varchar(50)			Default Null,
			Primary Key (TheaterID));
#Create Movie Table
CREATE TABLE `MOVIE`(
			MovieID		int(11)				Not NULL auto_increment, 
            Mtitle		varchar(50)			Default Null,
            Rating		varchar(50)			Default Null,
			Primary Key (MovieID));
#Create Artist Table 
CREATE TABLE `ARTIST`(
			ArtistID	Int(11)				Not Null auto_increment,
            Name		varchar(50)			Default Null,
            Primary Key (ArtistID));
#Create Show Table 
CREATE TABLE `SHOW`(
			ShowID		Int(11)				Not Null auto_increment,
            Showtime	Time				Default Null, 
            MovieID		Int(11)				Default Null, 
			TheaterID	Int(11)				Default Null, 
            Primary Key (ShowID)); 
#Create Credit Table 
CREATE TABLE `CREDIT`(
			CreditID	Int(11)				Not Null auto_increment,
            CCode		varchar(1)			Default Null,
            CName		varchar(50)			Default Null,
            MovieID		Int(11)				Default Null,
            TheaterID	Int(11) 			Default Null, 
            Primary Key (CreditID));
#Add FK's 
ALTER TABLE `SHOW`
	ADD FOREIGN KEY (`TheaterID`)
    REFERENCES `THEATER` (`TheaterID`); 
ALTER TABLE `SHOW`
	ADD foreign key (`MovieID`)
    REFERENCES `MOVIE` (`MovieID`); 

ALTER TABLE `CREDIT`
	ADD foreign key Credit_Moive(`MovieID`)
    REFERENCES `MOVIE` (`MovieID`);
#Need to add ArtistID to Credit Table 
ALTER TABLE `CREDIT` ADD COLUMN ArtistID INT(11);
#Now FK 
ALTER TABLE `CREDIT`
	ADD foreign key Credit_Artist (`ArtistID`)
    REFERENCES `Artist` (`ArtistID`); 
#Drop foreign keys so can go back and name them 
ALTER TABLE `SHOW` DROP FOREIGN KEY `show_ibfk_1`;
ALTER TABLE `SHOW` DROP FOREIGN KEY `show_ibfk_2`;
#Rename the foreign keys 
ALTER TABLE `SHOW`
	ADD FOREIGN KEY Show_Theater(`TheaterID`)
    REFERENCES `THEATER` (`TheaterID`); 
ALTER TABLE `SHOW`
	ADD foreign key Show_Movie (`MovieID`)
    REFERENCES `MOVIE` (`MovieID`); 