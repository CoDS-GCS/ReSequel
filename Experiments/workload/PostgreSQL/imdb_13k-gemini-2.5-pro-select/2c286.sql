
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.43)',
                   '(#4.14)',
                   '(#4.24)',
                   'A Midsummer Nights Dream',
                   'Aoi sanmyaku',
                   'Bad Boy',
                   'Bedtime Story',
                   'Dr. Jekyll and Mr. Hyde',
                   'Driftwood',
                   'Love Story',
                   'Meet Me in St. Louis',
                   'Roger la Honte',
                   'The Inheritance',
                   'The Inside Man')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Animation',
                    'History',
                    'Horror',
                    'Romance',
                    'Western')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:130 m',
                    'MET:1500 m',
                    'MET:180 m',
                    'MET:225 m',
                    'MET:900 m',
                    'OFM:16 mm',
                    'PCS:Shawscope',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1')
  AND rt.role IN ('actor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);