
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM company_name AS cn
JOIN movie_companies AS mc ON cn.id = mc.company_id
JOIN title AS t ON mc.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE cn.name ILIKE '%cen%'
  AND t.production_year BETWEEN 1945 AND 1990
  AND kt.kind ILIKE '%s%'
  AND mi1.info_type_id IN ('2')
  AND mi1.info ILIKE '%whi%'
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;