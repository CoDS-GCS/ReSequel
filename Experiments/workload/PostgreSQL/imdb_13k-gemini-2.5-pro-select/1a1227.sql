 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1981 + 1 AND 1997
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Adult',
                   'Crime',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Horror',
                   'Sci-Fi',
                   'Short',
                   'Thriller')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('CAM:Panavision Cameras and Lenses',
                   'OFM:35 mm',
                   'OFM:Video',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')) AS ci ON t.id = ci.movie_id;