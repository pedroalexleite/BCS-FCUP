USE MOVIE_STREAM;

SELECT Title FROM MOVIE NATURAL JOIN ACTOR NATURAL JOIN MOVIE_ACTOR WHERE ACTOR.Name = 'Tom Cruise' ORDER BY Title;