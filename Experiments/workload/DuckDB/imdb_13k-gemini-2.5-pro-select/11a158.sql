
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON cn.id = mc.company_id
JOIN company_type AS ct ON ct.id = mc.company_type_id
JOIN kind_type AS kt ON kt.id = t.kind_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it ON it.id = mi1.info_type_id
WHERE kt.kind ILIKE '%vi%'
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
  AND t.production_year <= 1990
  AND t.production_year >= 1945
  AND it.id IN ('6')
  AND mi1.info ILIKE '%sd%'
  AND cn.name ILIKE '%br%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;