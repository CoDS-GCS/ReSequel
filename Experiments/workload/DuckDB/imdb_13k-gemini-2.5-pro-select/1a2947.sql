
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
     WHERE ROLE IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$10,000,000',
                    '$2,500',
                    '$20,000,000',
                    '$25,000',
                    '$5,000,000',
                    'CAD 10,000',
                    '£2,000',
                    '£500')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Arabic',
                    'French',
                    'Hebrew',
                    'Hindi',
                    'Japanese',
                    'Mandarin',
                    'None',
                    'Portuguese',
                    'Russian',
                    'Spanish');