
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Lenses and Panaflex Cameras by Panavision',
                    'CAM:Panasonic AG-HVX200',
                    'LAB:DeLuxe, London, UK',
                    'LAB:DeLuxe, USA',
                    'OFM:HD',
                    'OFM:HDCAM',
                    'OFM:Super 16')
  AND it2.id IN ('18')
  AND mi2.info IN ('Dublin, County Dublin, Ireland',
                    'Hamilton, Ontario, Canada',
                    'Marina del Rey, California, USA',
                    'Netherlands',
                    'Oahu, Hawaii, USA',
                    'Ren-Mar Studios - 846 N. Cahuenga Blvd., Hollywood, Los Angeles, California, USA',
                    'Stage 37, Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND rt.role IN ('costume designer',
                   'director',
                   'guest')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);