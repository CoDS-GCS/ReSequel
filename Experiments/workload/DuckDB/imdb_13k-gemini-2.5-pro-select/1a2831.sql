
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 1975
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
     WHERE ROLE IN ('composer',
                   'guest',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:',
                    'MET:200 m',
                    'OFM:16 mm',
                    'OFM:Video',
                    'PCS:(anamorphic)',
                    'PCS:Shawscope',
                    'PCS:Techniscope',
                    'PFM:16 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.20 : 1',
                    'RAT:4:3')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Belgium',
                    'Brazil',
                    'Germany',
                    'Hong Kong',
                    'Japan',
                    'Portugal',
                    'Taiwan',
                    'Turkey');