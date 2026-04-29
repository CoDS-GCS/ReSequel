 
 
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
WHERE it1.id = '8'
  AND it2.id = '4'
  AND t.production_year <= 1975
  AND t.production_year > 1875
  AND mi1.info IN ('Canada',
                   'Egypt',
                   'Hungary',
                   'Italy',
                   'Romania')
  AND mi2.info IN ('Arabic',
                   'French',
                   'Hungarian',
                   'Romanian')
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('m');