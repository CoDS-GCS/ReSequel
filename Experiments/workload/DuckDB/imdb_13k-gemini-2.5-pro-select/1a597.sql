
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f',
                   'm')
  AND rt.role IN ('costume designer',
                  'director')
  AND t.production_year <= 1990
  AND t.production_year > 1950
  AND kt.kind IN ('movie',
                  'tv movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Crime',
                   'Drama',
                   'Romance')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Iceland:16',
                   'Sweden:11',
                   'West Germany:12');