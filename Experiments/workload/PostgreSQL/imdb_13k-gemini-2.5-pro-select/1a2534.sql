 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'director',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$10,000,000',
                    '$100',
                    '$150,000',
                    '$25,000,000',
                    '$3,000',
                    '$3,500',
                    '$50,000',
                    '$500',
                    '$6,000,000',
                    '$75,000',
                    '$8,000',
                    '£5,000',
                    '€ 15,000',
                    '€ 5,000',
                    '€ 50,000')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Greece',
                    'India',
                    'Italy',
                    'Spain',
                    'Sweden',
                    'USA');