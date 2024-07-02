USE MOVIE_STREAM;

SELECT Year(StreamDate), COUNT(*), SUM(Charge) FROM STREAM Group BY Year(StreamDate); 