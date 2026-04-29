
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Nigeria',
                    'USA')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Nigeria:2007',
                    'USA:1993',
                    'USA:1995',
                    'USA:1996',
                    'USA:1997',
                    'USA:1998',
                    'USA:1999',
                    'USA:2000')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'editor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'character-name-in-title',
                     'father-daughter-relationship',
                     'fight',
                     'hardcore',
                     'interview',
                     'lesbian-sex',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'new-york-city',
                     'number-in-title',
                     'one-word-title',
                     'sequel',
                     'surrealism',
                     'tv-mini-series'));