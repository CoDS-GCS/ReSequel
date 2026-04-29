
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
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'LAB:DeLuxe',
                    'LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'OFM:16 mm',
                    'OFM:Live',
                    'PCS:(anamorphic)',
                    'PCS:CinemaScope',
                    'PCS:Techniscope',
                    'PCS:Tohoscope',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3')
  AND it2.id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Ultra Stereo')
  AND n.gender IS NULL
  AND rt.role IN ('costume designer');