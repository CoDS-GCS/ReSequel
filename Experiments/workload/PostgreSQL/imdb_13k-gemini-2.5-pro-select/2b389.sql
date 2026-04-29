
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci,
     movie_keyword AS mk
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:',
                    'MET:100 m',
                    'MET:15.2 m',
                    'MET:1500 m',
                    'MET:23 m',
                    'MET:30 m',
                    'MET:300 m',
                    'PCS:Panavision',
                    'PCS:Techniscope',
                    'PFM:16 mm',
                    'PFM:68 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.37 : 1')
  AND mi2.info IN ('Mono',
                    'Silent')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('6')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'doctor',
                     'hardcore',
                     'jealousy',
                     'new-york-city',
                     'one-word-title'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL);