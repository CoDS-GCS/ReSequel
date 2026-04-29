
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 + 1 AND 1925
  AND kt.kind IN ('movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adventure',
                   'Documentary',
                   'Drama',
                   'Fantasy',
                   'Short')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:15.2 m',
                   'MET:15.24 m',
                   'MET:200 m',
                   'MET:23 m',
                   'MET:900 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'RAT:1.33 : 1')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('m');