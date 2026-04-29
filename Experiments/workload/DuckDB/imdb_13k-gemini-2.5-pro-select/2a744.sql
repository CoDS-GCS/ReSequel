
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'video game')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Canon XL-1',
                    'CAM:Sony HDW-F900',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:Technicolor',
                    'OFM:HDCAM',
                    'OFM:Redcode RAW',
                    'OFM:Video',
                    'PCS:HDCAM',
                    'PCS:Panavision',
                    'PCS:Redcode RAW',
                    'PCS:Spherical',
                    'RAT:16:9 HD')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('f');