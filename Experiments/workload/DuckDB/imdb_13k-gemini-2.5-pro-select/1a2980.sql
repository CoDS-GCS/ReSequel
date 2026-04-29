
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'video game',
                   'video movie')
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Biography',
                    'Documentary',
                    'History',
                    'Horror',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Talk-Show',
                    'War',
                    'Western')
  AND n.gender IS NULL
  AND rt.role IN ('guest',
                   'miscellaneous crew',
                   'production designer');