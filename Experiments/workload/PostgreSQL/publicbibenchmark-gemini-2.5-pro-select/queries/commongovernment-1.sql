
SELECT agname
FROM
  (SELECT agname
   FROM commongovernment1
   GROUP BY agname) AS t
ORDER BY agname ASC;