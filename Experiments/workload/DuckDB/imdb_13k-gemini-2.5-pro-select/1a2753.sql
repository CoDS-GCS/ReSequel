
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('movie',
                   'tv series',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby Stereo',
                    'SDDS',
                    'Silent',
                    'Sonics-DDP',
                    'Ultra Stereo')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arriflex Cameras',
                    'CAM:Panasonic AG-DVX100',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'PCS:Panavision',
                    'PFM:16 mm',
                    'PFM:Digital',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer');