
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('California, USA',
                    'Central Park, Manhattan, New York City, New York, USA',
                    'Hawaii, USA',
                    'Istanbul, Turkey',
                    'Leipzig, Saxony, Germany',
                    'Metro Manila, Luzon, Philippines',
                    'New York, USA',
                    'Philippines',
                    'Santa Clarita, California, USA',
                    'Seoul, South Korea',
                    'Sony Pictures Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Tampa, Florida, USA',
                    'Zagreb, Croatia')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Filipino',
                    'French',
                    'Korean',
                    'Persian',
                    'Serbo-Croatian',
                    'Slovak',
                    'Telugu',
                    'Turkish');