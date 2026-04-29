
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 + 1 AND 2015
  AND kt.kind IN ('movie',
                  'video movie')
  AND n.gender IN ('f')
  AND rt.role IN ('cinematographer',
                  'production designer')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Fantasy',
                   'Romance',
                   'Sci-Fi',
                   'Short',
                   'Thriller',
                   'War')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Arriflex Cameras',
                   'CAM:Canon 7D',
                   'CAM:Red One Camera',
                   'PCS:Super 35',
                   'PFM:35 mm',
                   'PFM:D-Cinema',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:16:9 HD');