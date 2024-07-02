USE MOVIE_STREAM;

SELECT Title, COUNT(StreamId) AS N FROM MOVIE LEFT OUTER JOIN STREAM ON(MOVIE.MovieId = STREAM.MovieId)
WHERE Year = 2015 GROUP BY Title HAVING N<=5;