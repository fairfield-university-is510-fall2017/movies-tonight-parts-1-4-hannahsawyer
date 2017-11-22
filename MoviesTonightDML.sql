#Load data into movie
INSERT INTO movie (Mtitle, Rating) SELECT DISTINCT MTitle, Rating
FROM DATASHEET;
#Load Data into theater
INSERT INTO theater (TName, Location, Phone)SELECT DISTINCT TName, Location, Phone
FROM DATASHEET;
#Make the datatype on location column larger
ALTER TABLE theater MODIFY COLUMN Location varchar(200);
#Load Data into Artist 
INSERT INTO artist (Name) SELECT DISTINCT CName 
FROM DATASHEET;
#Delete Two Columns from credit table 
ALTER TABLE credit DROP CName;
AlTER TABLE credit DROP TheaterID;
#Load Data into credits 
INSERT INTO credit (MovieID, CCode, ArtistID) SELECT DISTINCT MovieID, CCode, ArtistID
FROM artist 
	JOIN Datasheet ON (DATASHEET.CName =artist.Name)
	JOIN movie ON (movie.Mtitle = DATASHEET.MTitle);
#Load Data into show 
INSERT INTO `show`(Showtime, MovieID, TheaterID) SELECT DISTINCT Showtime, MovieID, TheaterID
FROM DATASHEET
	JOIN theater ON (DATASHEET.TName = theater.TName)
    JOIN movie ON (DATASHEET.Mtitle =movie.Mtitle);
#check duplicates
SELECT *,count(*) FROM DATASHEET
GROUP BY MTitle, TName, Showtime, CCode, CName
having count(*)>1;
#Drop DATASHEET 
