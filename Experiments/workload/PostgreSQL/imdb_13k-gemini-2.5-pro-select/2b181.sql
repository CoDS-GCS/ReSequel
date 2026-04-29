
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Romance',
                    'Short')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Belgium',
                    'Canada',
                    'Germany')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'character-name-in-title',
                     'death',
                     'dog',
                     'gay',
                     'gun',
                     'independent-film',
                     'interview',
                     'jealousy',
                     'murder',
                     'nudity',
                     'sequel',
                     'sex'));