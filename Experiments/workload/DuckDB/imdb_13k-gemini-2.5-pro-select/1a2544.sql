
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'miscellaneous crew',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Bulgarian',
                    'Chinese',
                    'Croatian',
                    'Dutch',
                    'Finnish',
                    'Greek',
                    'Persian',
                    'Serbo-Croatian',
                    'Slovak',
                    'Slovenian',
                    'Telugu',
                    'Vietnamese')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'Bangkok, Thailand',
                    'Lisbon, Portugal',
                    'Long Beach, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Pasadena, California, USA',
                    'St. Petersburg, Russia',
                    'Stage 10, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA');