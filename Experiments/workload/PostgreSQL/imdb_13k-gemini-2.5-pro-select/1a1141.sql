 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('m')
  AND rt.role IN ('producer')
  AND t.production_year <= 1990
  AND t.production_year > 1950
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Animation',
                   'Documentary',
                   'Drama',
                   'Family',
                   'History',
                   'Romance',
                   'Sport',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('LAB:Technicolor',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:1.66 : 1',
                   'RAT:1.85 : 1');