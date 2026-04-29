 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('m')
  AND rt.role IN ('miscellaneous crew')
  AND t.production_year <= 1975
  AND t.production_year > 1925
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Animation',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Mystery',
                   'Short')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:G',
                   'Finland:K-16',
                   'Finland:S',
                   'Sweden:15',
                   'USA:Approved',
                   'USA:Passed');