
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('USA:X')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:2004')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-novel',
                     'character-name-in-title',
                     'dog',
                     'father-daughter-relationship',
                     'female-nudity',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'husband-wife-relationship',
                     'interview',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'non-fiction',
                     'party',
                     'revenge',
                     'sequel',
                     'sex',
                     'surrealism'));