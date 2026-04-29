
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN title AS t ON ci.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer'))
  AND pi.info_type_id IN ('39')
  AND mi1.info_type_id IN ('16')
  AND pi.info ILIKE '%usa%'
  AND mi1.info ILIKE '%rom%'
GROUP BY mi1.info,
         pi.info;