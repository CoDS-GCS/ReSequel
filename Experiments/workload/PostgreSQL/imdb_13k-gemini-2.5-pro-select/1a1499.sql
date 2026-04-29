 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Adult',
                   'Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'History',
                   'Romance',
                   'Sport',
                   'Thriller',
                   'War')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('CAM:Panavision Cameras and Lenses',
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
                   'RAT:1.85 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('costume designer',
                  'production designer')) AS ci ON t.id = ci.movie_id;