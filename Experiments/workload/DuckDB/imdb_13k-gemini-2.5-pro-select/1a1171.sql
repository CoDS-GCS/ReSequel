WITH movies_with_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Adult',
                   'Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Fantasy',
                   'Horror',
                   'Short',
                   'Thriller')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                   'OFM:16 mm',
                   'OFM:35 mm',
                   'OFM:Video',
                   'PCS:Digital Intermediate',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'PFM:Video',
                   'RAT:1.37 : 1'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movies_with_info AS mwi ON t.id = mwi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1925 + 1 AND 2015
  AND kt.kind IN ('tv series',
                  'video game')
  AND n.gender IN ('f')
  AND rt.role IN ('editor');