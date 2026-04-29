
SELECT whocanuse
FROM
  (SELECT DISTINCT whocanuse
   FROM commongovernment13) AS t
ORDER BY whocanuse ASC;