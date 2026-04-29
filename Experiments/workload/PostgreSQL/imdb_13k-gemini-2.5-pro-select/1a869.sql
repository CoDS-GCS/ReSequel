 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 1975
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Musical',
                   'Romance',
                   'Short')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:PG',
                   'Finland:K-16',
                   'Finland:S',
                   'Sweden:15',
                   'Sweden:Btl',
                   'UK:U',
                   'USA:Approved',
                   'USA:Passed',
                   'USA:R')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('f');