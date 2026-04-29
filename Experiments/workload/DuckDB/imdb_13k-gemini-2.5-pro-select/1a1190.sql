
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2010
  AND t.production_year > 2000
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Drama',
                   'Music',
                   'Sci-Fi',
                   'Short')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:35 mm',
                   'OFM:Super 16',
                   'PFM:Video',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1')
  AND rt.role IN ('editor',
                  'production designer')
  AND n.gender IN ('f');