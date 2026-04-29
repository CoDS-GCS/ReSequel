WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('editor')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND it1.id IN ('4')
  AND mi1.info IN ('Arabic',
                    'Czech',
                    'Finnish',
                    'Hindi',
                    'Portuguese')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Arriflex Cameras',
                    'CAM:Panavision Cameras and Lenses',
                    'LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'OFM:35 mm',
                    'PCS:(anamorphic)',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Techniscope',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.20 : 1');