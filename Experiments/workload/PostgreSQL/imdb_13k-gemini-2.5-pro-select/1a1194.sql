 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 + 1 AND 1975
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND n.gender IN ('m')
  AND rt.role IN ('actor',
                  'producer')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Drama',
                   'Short',
                   'Sport')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:900 m',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1');