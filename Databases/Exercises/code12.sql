USE MOVIE_STREAM;

SELECT REGION.Name, COUNT(*) FROM REGION JOIN COUNTRY ON(REGION.RegionId = COUNTRY.RegionId) GROUP BY REGION.Name ORDER BY COUNT(*);