
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
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('106',
                    '117',
                    '22',
                    '45',
                    '71',
                    '77',
                    'Germany:95',
                    'USA:105')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arriflex Cameras',
                    'CAM:Panaflex Camera and Lenses by Panavision',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Technicolor, USA',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:4:3')
  AND n.gender IS NULL
  AND rt.role IN ('actor',
                   'director',
                   'production designer',
                   'writer');