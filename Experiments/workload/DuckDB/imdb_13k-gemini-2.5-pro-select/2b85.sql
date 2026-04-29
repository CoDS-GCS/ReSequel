
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
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'German')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:G',
                    'Finland:K-16',
                    'Sweden:15',
                    'Sweden:Btl',
                    'UK:PG',
                    'USA:Passed',
                    'USA:R',
                    'West Germany:12')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-chested-male',
                     'based-on-novel',
                     'based-on-play',
                     'death',
                     'doctor',
                     'dog',
                     'father-son-relationship',
                     'female-nudity',
                     'gay',
                     'homosexual',
                     'interview',
                     'lesbian',
                     'love',
                     'non-fiction',
                     'revenge',
                     'sex',
                     'singer',
                     'surrealism'));