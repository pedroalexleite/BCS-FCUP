USE MOVIE_STREAM;

SELECT REGION.Name, STAFF.Name FROM REGION JOIN STAFF ON(REGION.RegionManager = STAFF.StaffId) ORDER BY REGION.Name;
