USE MOVIE_STREAM;

SELECT GENRE.Label, REGION.Name, COUNT(StreamId) FROM (GENRE JOIN REGION) 
LEFT OUTER JOIN (CUSTOMER NATURAL JOIN STREAM NATURAL JOIN MOVIE_GENRE JOIN COUNTRY ON(CUSTOMER.Country = COUNTRY.Name)) 
USING (GenreId, RegionId) GROUP BY GENRE.Label, REGION.Name 
ORDER BY GENRE.Label, REGION.Name;
