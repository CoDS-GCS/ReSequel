
SELECT bureauname
FROM
  (SELECT DISTINCT ON (bureauname) bureauname
   FROM commongovernment3
   ORDER BY bureauname) AS t;