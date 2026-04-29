WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 2000 + 1 AND 2010
     AND kt.kind IN ('tv movie',
                  'video game')
     AND mi1.info_type_id = '3'
     AND mi1.info IN ('Adventure',
                   'Animation',
                   'Crime',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Horror',
                   'Romance',
                   'Sci-Fi',
                   'Short',
                   'Thriller')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('CAM:Red One Camera',
                   'OFM:35 mm',
                   'OFM:Super 16',
                   'PCS:Digital Intermediate',
                   'PFM:35 mm',
                   'RAT:1.78 : 1',
                   'RAT:2.35 : 1'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('m')
  AND rt.role IN ('editor');