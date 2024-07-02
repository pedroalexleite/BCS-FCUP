USE MOVIE_STREAM;

SELECT Title, StreamDate, Charge FROM MOVIE NATURAL JOIN STREAM 
WHERE Month(StreamDate) = 12 AND Year(StreamDate) = 2017 
ORDER BY Title, StreamDate DESC; 