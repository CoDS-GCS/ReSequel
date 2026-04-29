 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('m')
  AND rt.role IN ('director')
  AND t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Horror',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:16 mm',
                   'OFM:35 mm',
                   'OFM:Video',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.85 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1');