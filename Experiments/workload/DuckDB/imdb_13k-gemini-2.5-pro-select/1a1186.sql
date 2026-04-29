WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Comedy',
                   'Drama',
                   'Music',
                   'Mystery',
                   'Short',
                   'Sport',
                   'Thriller',
                   'Western')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('CAM:Arriflex Cameras and Lenses',
                   'CAM:Arriflex Cameras',
                   'CAM:Canon 7D',
                   'CAM:Panavision Cameras and Lenses',
                   'LAB:DeLuxe',
                   'LAB:FotoKem Laboratory, Burbank (CA), USA',
                   'PCS:Digital Intermediate',
                   'PCS:Spherical',
                   'PCS:Super 16',
                   'PFM:16 mm',
                   'RAT:1.20 : 1',
                   'RAT:1.33 : 1',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('miscellaneous crew'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1925 + 1 AND 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie');