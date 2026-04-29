
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$1,000',
                    '$1,000,000',
                    '$2,000,000',
                    '$35,000',
                    '$40,000',
                    '$75,000',
                    '$8,000',
                    '£1,000');