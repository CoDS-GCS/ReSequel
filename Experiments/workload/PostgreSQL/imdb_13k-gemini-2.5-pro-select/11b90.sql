
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON kt.id = t.kind_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE kt.kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'video game')
  AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'producer')
  AND t.production_year BETWEEN 1875 AND 1945
  AND it1.id IN ('4')
  AND mi1.info ILIKE '%e%'
  AND pi.info ILIKE '%0-%'
  AND it2.id IN ('29')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;