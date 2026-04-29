 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Fantasy',
                   'Mystery',
                   'Sci-Fi',
                   'Short',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '7'
AND mi2.info IN ('CAM:Canon 7D',
                   'CAM:Panavision Cameras and Lenses',
                   'LAB:FotoKem Laboratory, Burbank (CA), USA',
                   'OFM:16 mm',
                   'OFM:Super 16',
                   'PCS:Digital Intermediate',
                   'PCS:Spherical',
                   'PCS:Super 35',
                   'PFM:D-Cinema',
                   'PFM:Video',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:1.78 : 1')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('costume designer');