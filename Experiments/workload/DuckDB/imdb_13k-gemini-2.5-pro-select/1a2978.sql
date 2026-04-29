
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
                   'editor',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,500,000',
                    '$10,000,000',
                    '$20,000',
                    '$200,000',
                    '$300,000',
                    '$35,000',
                    '$500',
                    'CAD 10,000',
                    '£1,000')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('10',
                    '13',
                    '14',
                    'USA:10',
                    'USA:12');