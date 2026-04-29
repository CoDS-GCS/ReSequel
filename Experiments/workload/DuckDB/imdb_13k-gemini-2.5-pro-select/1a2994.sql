
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Arricam LT, Zeiss Master Prime Lenses',
                    'CAM:Arricam ST, Zeiss Ultra Prime and Angenieux Optimo Lenses',
                    'CAM:Clairmont Camera',
                    'CAM:Moviecam Cameras',
                    'LAB:ARRI Film & TV, München, Germany',
                    'LAB:Framestore CFC, London, UK',
                    'LAB:Laboratoires LTC, St. Cloud, France',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'LAB:Technicolor, UK',
                    'PCS:(anamorphic)',
                    'PCS:Digital 3-D',
                    'PCS:Digital Betacam',
                    'PFM:CD-ROM',
                    'PFM:Digital',
                    'PFM:Video')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Belgium:KT',
                    'Canada:16+',
                    'France:U',
                    'Iceland:12',
                    'Iceland:14',
                    'India:UA',
                    'Peru:18',
                    'Portugal:M/4',
                    'UK:PG');