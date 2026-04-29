WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Animation',
                   'Crime',
                   'Drama',
                   'Fantasy',
                   'Horror',
                   'Thriller')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('LAB:FotoKem Laboratory, Burbank (CA), USA',
                   'PCS:Digital Intermediate',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.85 : 1'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2010
  AND t.production_year > 2000
  AND kt.kind IN ('episode',
                  'video movie')
  AND rt.role IN ('composer',
                  'miscellaneous crew')
  AND n.gender IN ('m');