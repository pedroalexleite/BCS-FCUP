USE MOVIE_STREAM;

DELETE FROM MOVIE_ACTOR WHERE ActorId IN(SELECT ActorId FROM ACTOR WHERE Name = 'Tom Cruise') 
AND MovieId IN(SELECT MovieId FROM MOVIE_GENRE NATURAL JOIN GENRE WHERE Label = 'Action');