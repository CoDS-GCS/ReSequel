WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.43)',
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
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Adventure',
                    'Animation',
                    'History',
                    'Horror',
                    'Romance',
                    'Western')
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
                    'RAT:1.85 : 1');