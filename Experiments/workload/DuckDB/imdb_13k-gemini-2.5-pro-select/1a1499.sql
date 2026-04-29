WITH t_ci_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('movie')
     AND n.gender IN ('f',
                   'm')
     AND rt.role IN ('costume designer',
                  'production designer'))
SELECT COUNT(*)
FROM t_ci_filtered AS t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adult',
                   'Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'History',
                   'Romance',
                   'Sport',
                   'Thriller',
                   'War')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                   'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PCS:Super 35',
                   'PFM:16 mm',
                   'PFM:35 mm',
                   'PFM:D-Cinema',
                   'PFM:Video',
                   'RAT:1.33 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1');