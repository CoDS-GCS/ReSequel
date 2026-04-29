
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'History',
                   'Thriller',
                   'Western')
  AND t.production_year <= 1975
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('LAB:Technicolor',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1')
  AND rt.role IN ('production designer')
  AND n.gender IN ('f');