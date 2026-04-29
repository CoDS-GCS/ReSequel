
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
  AND mi1.info IN ('Argentina',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('10',
                    '43',
                    '75',
                    '87',
                    'Argentina:60',
                    'UK:30',
                    'USA:85')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'death',
                     'father-son-relationship',
                     'female-nudity',
                     'fight',
                     'gun',
                     'hospital',
                     'independent-film',
                     'interview',
                     'love',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'surrealism',
                     'tv-mini-series'));