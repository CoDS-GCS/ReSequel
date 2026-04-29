 
 WITH filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('composer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
WHERE t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adult',
                   'Adventure',
                   'Animation',
                   'Documentary',
                   'Drama',
                   'Music',
                   'Romance',
                   'Short')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Arabic',
                   'Dutch',
                   'French',
                   'German',
                   'Hungarian',
                   'Italian',
                   'Mandarin',
                   'Polish',
                   'Russian');