 
 
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
  AND kt.kind IN ('tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Horror',
                   'Thriller',
                   'Western')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:35 mm',
                   'PCS:Spherical',
                   'RAT:1.33 : 1',
                   'RAT:2.35 : 1')
  AND rt.role IN ('composer',
                  'director')
  AND n.gender IN ('m');