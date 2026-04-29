
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
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
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Canon XL-2',
                    'CAM:Panavision Camera and Lenses',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'LAB:Technicolor, USA',
                    'PCS:HDV',
                    'PCS:Redcode RAW',
                    'PFM:16 mm',
                    'PFM:Digital',
                    'RAT:1.66 : 1')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('117',
                    '124',
                    '130',
                    '18',
                    'UK:90',
                    'USA:10',
                    'USA:100',
                    'USA:120',
                    'USA:20');