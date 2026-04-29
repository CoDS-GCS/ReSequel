 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Drama',
                   'Mystery',
                   'Romance')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:G',
                   'Finland:K-16',
                   'Finland:S',
                   'Sweden:Btl',
                   'UK:PG',
                   'USA:Approved',
                   'USA:Passed',
                   'USA:R',
                   'West Germany:16')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('composer',
                  'editor')) AS ci ON t.id = ci.movie_id;