
SELECT ze2010lib,
       AVG(CAST(latitude AS DOUBLE PRECISION)) AS avglatitudeok,
       AVG(longitude) AS avglongitudeok,
       SUM(empsalnp1) AS sumempsalnp1ok
FROM salariesfrance9
GROUP BY ze2010lib;