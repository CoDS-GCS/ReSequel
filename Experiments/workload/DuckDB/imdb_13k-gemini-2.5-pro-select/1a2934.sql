
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('18')
  AND it2.id IN ('7')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Milan, Lombardia, Italy',
                    'Munich, Bavaria, Germany',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Stage 41, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Studio 8H, NBC Studios - 30 Rockefeller Plaza, Manhattan, New York City, New York, USA')
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Techniscope',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.20 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('composer',
                   'producer',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1925 AND 1975;