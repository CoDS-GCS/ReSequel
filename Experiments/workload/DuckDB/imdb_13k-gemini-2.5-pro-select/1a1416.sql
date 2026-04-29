
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f')
  AND rt.role IN ('composer',
                  'editor')
  AND t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('episode',
                  'movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Fantasy',
                   'Horror',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:16 mm',
                   'OFM:35 mm',
                   'PCS:Digital Intermediate',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:16:9 HD');