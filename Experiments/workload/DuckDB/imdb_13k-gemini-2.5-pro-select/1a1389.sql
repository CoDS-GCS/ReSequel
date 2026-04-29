
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Animation',
                   'Biography',
                   'Comedy',
                   'Fantasy',
                   'Mystery',
                   'Short',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '7'
AND mi2.info IN ('CAM:Arriflex Cameras',
                   'PCS:Spherical',
                   'PCS:Super 35',
                   'PFM:35 mm',
                   'PFM:D-Cinema',
                   'RAT:1.33 : 1',
                   'RAT:1.66 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                  'production designer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 2015
  AND t.production_year > 1990;