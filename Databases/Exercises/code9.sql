USE MOVIE_STREAM;

SELECT Title, Duration, Year, StreamDate FROM MOVIE JOIN STREAM ON(MOVIE.MovieId = STREAM.MovieId) WHERE Duration>=140 AND Year = YEAR(StreamDate)-1;