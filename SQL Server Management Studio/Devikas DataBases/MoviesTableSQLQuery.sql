CREATE TABLE Movies (movieName varchar(255));

SELECT * FROM Movies

INSERT INTO Movies (movieName)
VALUES ('Titanic');    

INSERT INTO Movies (movieName)
VALUES ('Interstellar');

INSERT INTO Movies (movieName)
VALUES ('Tenet');

INSERT INTO Movies (movieName)
VALUES ('Avengers');

INSERT INTO Movies (movieName)
VALUES ('Endgame');

SET ROWCOUNT 1
DELETE FROM Movies WHERE movieName='Titanic'
SET ROWCOUNT 0

SET ROWCOUNT 1
DELETE FROM Movies WHERE movieName='Interstellar'
SET ROWCOUNT 0

SET ROWCOUNT 1
DELETE FROM Movies WHERE movieName='Tenet'
SET ROWCOUNT 0

SET ROWCOUNT 1
DELETE FROM Movies WHERE movieName='Avengers'
SET ROWCOUNT 0

SET ROWCOUNT 1
DELETE FROM Movies WHERE movieName='Endgame'
SET ROWCOUNT 0

INSERT INTO Movies (movieName)
VALUES ('Titanic');