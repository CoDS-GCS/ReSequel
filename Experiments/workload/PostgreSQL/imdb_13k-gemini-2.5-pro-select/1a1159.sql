 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 + 1 AND 1975
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Comedy',
                   'Documentary',
                   'Sci-Fi',
                   'Short',
                   'Sport')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:150 m',
                   'MET:200 m',
                   'MET:23 m',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.20 : 1',
                   'RAT:1.66 : 1')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('f');