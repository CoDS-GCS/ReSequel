
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Technicolor, Hollywood (CA), USA',
                    'MET:140 m',
                    'MET:180 m',
                    'MET:250 m',
                    'MET:305 m',
                    'MET:6000 m',
                    'OFM:16 mm',
                    'OFM:Video',
                    'PCS:SuperScope',
                    'PCS:Techniscope',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.75 : 1',
                    'RAT:2.00 : 1')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('France:1908',
                    'France:1911',
                    'France:1912',
                    'Italy:1907',
                    'USA:1956');