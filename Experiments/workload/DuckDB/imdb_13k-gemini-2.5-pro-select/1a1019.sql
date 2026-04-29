
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 + 1 AND 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND n.gender IN ('f')
  AND rt.role IN ('costume designer',
                  'production designer')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Drama',
                   'Romance',
                   'Short',
                   'War',
                   'Western')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Arriflex Cameras and Lenses',
                   'MET:',
                   'OFM:Super 16',
                   'PCS:(anamorphic)',
                   'PCS:Digital Intermediate',
                   'PFM:Video',
                   'RAT:1.20 : 1',
                   'RAT:1.85 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1');