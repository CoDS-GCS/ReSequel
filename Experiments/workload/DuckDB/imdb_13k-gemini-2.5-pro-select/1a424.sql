
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Crime',
                   'Fantasy',
                   'Horror',
                   'Musical',
                   'Mystery',
                   'Thriller',
                   'War',
                   'Western')
  AND t.production_year <= 1970
  AND t.production_year > 1950
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi2.info_type_id = '2'
  AND mi2.info IN ('Black and White',
                   'Color')
  AND rt.role IN ('production designer')
  AND n.gender IN ('m');