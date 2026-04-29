
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'video game',
                   'video movie')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'director',
                   'guest'))
  AND mi1.info_type_id IN ('108')
  AND pi.info_type_id IN ('39')
  AND mi1.info ILIKE '%janu%'
  AND pi.info ILIKE '%bu%'
GROUP BY mi1.info,
         pi.info;