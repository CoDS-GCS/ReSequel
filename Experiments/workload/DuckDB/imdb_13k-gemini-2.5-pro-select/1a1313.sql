
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Music')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '7'
AND mi2.info IN ('CAM:Arriflex Cameras',
                   'CAM:Red One Camera',
                   'LAB:FotoKem Laboratory, Burbank (CA), USA',
                   'OFM:35 mm',
                   'OFM:Digital',
                   'OFM:Redcode RAW',
                   'OFM:Super 16',
                   'PCS:Super 35',
                   'PFM:Video',
                   'RAT:1.37 : 1',
                   'RAT:1.85 : 1',
                   'RAT:16:9 HD')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('costume designer',
                  'production designer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 2015
  AND t.production_year > 1975;