
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'director',
                   'guest',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$150,000',
                    '$2,500,000',
                    '$25,000',
                    '$3,000,000',
                    '$4,000',
                    '$5,000,000',
                    '$6,000',
                    '$75,000',
                    '£1,000',
                    '€ 20,000')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Arabic',
                    'Finnish',
                    'Hebrew',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'None',
                    'Norwegian',
                    'Portuguese',
                    'Russian',
                    'Spanish',
                    'Swedish');