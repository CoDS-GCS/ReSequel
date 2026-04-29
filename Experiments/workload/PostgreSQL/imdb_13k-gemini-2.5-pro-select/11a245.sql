
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON cn.id = mc.company_id
JOIN kind_type AS kt ON kt.id = t.kind_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
WHERE kt.kind ILIKE '%m%'
  AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND t.production_year BETWEEN 1945 AND 1990
  AND mi1.info_type_id IN ('5')
  AND mi1.info ILIKE '%sw%'
  AND cn.name ILIKE '%nati%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;