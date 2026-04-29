 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 2000 + 1 AND 2010
  AND kt.kind IN ('tv movie',
                  'video game')
  AND n.gender IN ('m')
  AND rt.role IN ('editor')
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
                   'RAT:2.35 : 1');