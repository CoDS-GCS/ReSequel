
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
  AND it1.id IN ('1')
  AND mi1.info IN ('1',
                    '11',
                    '116',
                    '15',
                    '22',
                    '62',
                    '64',
                    '74',
                    '9',
                    '97',
                    'France:85',
                    'USA:26',
                    'USA:74',
                    'USA:98')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'LAB:Technicolor, USA',
                    'MET:',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Kinescope',
                    'PCS:Spherical',
                    'PFM:70 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1')
  AND n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew');