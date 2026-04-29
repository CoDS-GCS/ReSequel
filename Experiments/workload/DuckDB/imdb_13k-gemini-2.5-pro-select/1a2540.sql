
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'composer',
                   'director',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Animation',
                    'Biography',
                    'Music',
                    'Mystery',
                    'Sci-Fi',
                    'Sport')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$1,000,000',
                    '$1,200',
                    '$10,000,000',
                    '$100,000',
                    '$200,000',
                    '$25,000,000',
                    '$3,500',
                    '$350,000',
                    '€ 10,000',
                    '€ 100,000',
                    '€ 2,000',
                    '€ 3,000',
                    '€ 30,000');