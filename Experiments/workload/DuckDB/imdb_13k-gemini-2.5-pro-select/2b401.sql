
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Stereo')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('PCS:Spherical',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'based-on-novel',
                     'female-frontal-nudity',
                     'fight',
                     'friendship',
                     'gay',
                     'independent-film',
                     'love',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'one-word-title',
                     'sequel',
                     'song'));