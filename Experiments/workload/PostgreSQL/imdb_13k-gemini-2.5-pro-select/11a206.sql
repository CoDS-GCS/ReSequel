
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
WHERE cn.name ILIKE '%ente%'
  AND t.production_year BETWEEN 1945 AND 1990
  AND kt.kind ILIKE '%s%'
  AND mi1.info_type_id IN ('5')
  AND mi1.info ILIKE '%aus%'
  AND rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;