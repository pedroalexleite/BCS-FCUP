USE MOVIE_STREAM;

SELECT Country, COUNT(CustomerId) AS N FROM STREAM RIGHT OUTER JOIN CUSTOMER
USING (CustomerId) WHERE StreamId IS NULL GROUP BY Country;
