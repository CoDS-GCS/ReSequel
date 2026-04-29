 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'writer'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('18'))
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('4'))
  AND mi2.info IN ('English',
                    'Spanish');