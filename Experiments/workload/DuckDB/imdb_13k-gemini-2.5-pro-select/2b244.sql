
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
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('Detroit, Michigan, USA',
                    'Helsinki, Finland',
                    'Los Angeles, California, USA',
                    'Minneapolis, Minnesota, USA',
                    'Nashville, Tennessee, USA',
                    'Stage 10, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Tokyo, Japan')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English',
                    'Finnish',
                    'Japanese',
                    'Spanish')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'doctor',
                     'dog',
                     'friendship',
                     'homosexual',
                     'male-nudity',
                     'nudity',
                     'one-word-title',
                     'surrealism',
                     'violence'));