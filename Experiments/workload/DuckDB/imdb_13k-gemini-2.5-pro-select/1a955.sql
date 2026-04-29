
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 + 1 AND 2015
  AND kt.kind IN ('movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Comedy',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:MA',
                   'Germany:16',
                   'Iceland:12',
                   'Netherlands:16',
                   'South Korea:15',
                   'Switzerland:7',
                   'USA:PG-13')
  AND rt.role IN ('writer')
  AND n.gender IN ('f');