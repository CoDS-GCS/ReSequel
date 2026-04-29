 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f')
  AND rt.role IN ('cinematographer')
  AND t.production_year <= 1997
  AND t.production_year > 1981
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.85 : 1');