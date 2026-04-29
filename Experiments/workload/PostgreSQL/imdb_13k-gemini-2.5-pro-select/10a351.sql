
SELECT n.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN title AS t ON ci.movie_id = t.id
WHERE n.name ILIKE '%noe%'
  AND mi1.info IN ('Spanish')
  AND mi1.info_type_id IN ('4')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'costume designer'))
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('video game',
                   'video movie'))
GROUP BY n.name,
         mi1.info;