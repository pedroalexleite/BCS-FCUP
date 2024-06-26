USE MOVIE_STREAM;

SELECT G.Name, COUNT(STAFF.StaffId) AS N FROM STAFF RIGHT OUTER JOIN STAFF AS G 
ON(STAFF.Supervisor = G.StaffId) GROUP BY G.Name ORDER BY N DESC, G.Name;