
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
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'director',
                   'guest'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,200',
                    '$100,000',
                    '$100,000,000',
                    '$110,000,000',
                    '$27,000,000',
                    '$48,000,000',
                    '$5,000',
                    '$50,000,000',
                    '$65,000',
                    '$68,000,000',
                    '$850,000',
                    '£100',
                    '€ 2,000',
                    '€ 4,000,000')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:2013');