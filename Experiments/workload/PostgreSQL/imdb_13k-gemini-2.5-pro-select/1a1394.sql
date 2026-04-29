 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('m')
  AND rt.role IN ('cinematographer')
  AND t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Arriflex Cameras',
                   'CAM:Panavision Cameras and Lenses',
                   'LAB:DeLuxe',
                   'MET:',
                   'OFM:16 mm',
                   'PCS:Digital Intermediate',
                   'RAT:16:9 HD');