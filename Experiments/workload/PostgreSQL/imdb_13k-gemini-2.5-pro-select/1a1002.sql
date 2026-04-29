 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                  'tv series')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Family',
                   'Mystery',
                   'Short',
                   'War')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '7'
AND mi2.info IN ('MET:600 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'RAT:1.20 : 1',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
WHERE t.production_year <= 1949
  AND t.production_year > 1928;