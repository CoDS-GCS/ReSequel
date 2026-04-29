
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
     WHERE ROLE IN ('actor',
                   'composer',
                   'director',
                   'production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('American Sign Language',
                    'Cantonese',
                    'Czech',
                    'German',
                    'Hebrew',
                    'Hungarian',
                    'Indonesian',
                    'Korean',
                    'Malay',
                    'None',
                    'Persian',
                    'Serbo-Croatian',
                    'Thai',
                    'Turkish',
                    'Ukrainian')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Brazil:18',
                    'Canada:AA',
                    'Canada:G',
                    'Finland:K-12',
                    'Singapore:R21',
                    'USA:G',
                    'USA:PG',
                    'USA:TV-G');