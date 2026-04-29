WITH movie_subset AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM movie_subset
INNER JOIN movie_info mi1 ON movie_subset.id = mi1.movie_id
INNER JOIN info_type it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info mi2 ON movie_subset.id = mi2.movie_id
INNER JOIN info_type it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info ci ON movie_subset.id = ci.movie_id
INNER JOIN name n ON ci.person_id = n.id
INNER JOIN role_type rt ON ci.role_id = rt.id
WHERE it1.id IN ('7')
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