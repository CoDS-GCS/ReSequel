
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('MET:100 m',
                    'MET:15.2 m',
                    'PCS:CinemaScope',
                    'PCS:Techniscope',
                    'PFM:68 mm',
                    'RAT:1.36 : 1')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Mono',
                    'Silent')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'bare-chested-male',
                     'blood',
                     'cigarette-smoking',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'female-nudity',
                     'gun',
                     'interview',
                     'male-frontal-nudity',
                     'non-fiction',
                     'one-word-title',
                     'party',
                     'revenge',
                     'sex',
                     'singer',
                     'song'));