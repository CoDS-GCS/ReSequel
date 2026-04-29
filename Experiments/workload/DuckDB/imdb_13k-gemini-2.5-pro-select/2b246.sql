
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
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'India',
                    'Netherlands',
                    'Sweden',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Amsterdam, Noord-Holland, Netherlands',
                    'Argentina',
                    'England, UK',
                    'India',
                    'Minneapolis, Minnesota, USA',
                    'Nashville, Tennessee, USA',
                    'North Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stockholm, Stockholms län, Sweden')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'blood',
                     'doctor',
                     'father-daughter-relationship',
                     'hardcore',
                     'jealousy',
                     'kidnapping',
                     'lesbian',
                     'number-in-title',
                     'singing',
                     'song',
                     'surrealism',
                     'tv-mini-series'));