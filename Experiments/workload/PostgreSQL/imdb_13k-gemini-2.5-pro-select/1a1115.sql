 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f')
  AND rt.role IN ('writer')
  AND t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('tv movie',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Comedy',
                   'Crime',
                   'Family',
                   'Horror',
                   'Sci-Fi',
                   'Thriller',
                   'War')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Red One Camera',
                   'OFM:35 mm',
                   'OFM:Digital',
                   'PCS:Spherical',
                   'PFM:D-Cinema',
                   'PFM:Video',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1');