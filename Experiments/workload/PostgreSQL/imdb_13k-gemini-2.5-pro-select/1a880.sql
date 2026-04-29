 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 + 1 AND 1990
     AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Comedy',
                   'Documentary',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Thriller',
                   'War')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:G',
                   'Australia:M',
                   'Belgium:KT',
                   'Finland:K-16',
                   'Finland:S',
                   'Singapore:PG',
                   'Sweden:15',
                   'UK:15',
                   'UK:A',
                   'West Germany:16',
                   'West Germany:6')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor')) AS ci ON t.id = ci.movie_id;