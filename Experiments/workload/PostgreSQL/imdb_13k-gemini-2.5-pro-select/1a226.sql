 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1981 + 1 AND 1997
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Documentary',
                   'Game-Show',
                   'Musical',
                   'Mystery',
                   'Sport',
                   'Talk-Show',
                   'War')
  AND mi2.info_type_id = '2'
  AND mi2.info IN ('Black and White',
                   'Color')
  AND rt.role IN ('actor',
                  'producer')
  AND n.gender IN ('f',
                   'm');