WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('abusive-woman',
                     'boy-bath-scene',
                     'boy-hit-by-a-truck',
                     'cabin-cruiser',
                     'curmudgeon',
                     'death-of-a-boy',
                     'extra-300s-airplane',
                     'female-coach',
                     'hollywood-machine',
                     'hollywood-nightclub',
                     'nineveh-syria',
                     'open-air-chessboard',
                     'parklands',
                     'reference-to-lou-ferrigno',
                     'reference-to-tina-turner',
                     'ripped-off-flesh',
                     'sacre-coeur-paris',
                     'school-killing',
                     'snippets',
                     'town-destroyed-by-a-volcano',
                     'underground-shaft'))
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
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND it2.id IN ('7')
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1')
  AND rt.role IN ('composer')
  AND n.gender IN ('m');