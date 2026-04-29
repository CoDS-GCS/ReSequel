 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Biography',
                   'Comedy',
                   'Fantasy',
                   'Short',
                   'Western')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('MET:600 m',
                   'MET:900 m',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.85 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor')) AS ci ON t.id = ci.movie_id;