 
 
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Comedy',
                   'Drama',
                   'Horror',
                   'Romance')
  AND t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:13',
                   'Argentina:16',
                   'Canada:14A',
                   'Iceland:12',
                   'Portugal:M/12',
                   'Singapore:NC-16',
                   'South Korea:12',
                   'South Korea:15',
                   'Switzerland:7',
                   'UK:15',
                   'USA:PG-13',
                   'USA:R')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('f');