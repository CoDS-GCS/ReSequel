
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('MET:100 m',
                    'MET:30 m',
                    'MET:900 m',
                    'OFM:Video',
                    'PFM:35 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Arabic',
                    'Czech',
                    'Finnish',
                    'Greek',
                    'Hindi',
                    'Mandarin',
                    'Serbo-Croatian',
                    'Swedish');