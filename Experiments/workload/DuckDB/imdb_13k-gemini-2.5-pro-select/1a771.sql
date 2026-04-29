
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Comedy',
                   'Drama')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Canada:13+',
                   'Finland:K-11',
                   'Hong Kong:IIA',
                   'Singapore:NC-16',
                   'Spain:18',
                   'Switzerland:12')
  AND rt.role IN ('composer',
                  'director')
  AND n.gender IN ('f');