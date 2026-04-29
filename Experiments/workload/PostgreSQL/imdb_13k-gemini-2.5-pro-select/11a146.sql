
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1875 AND 1945
  AND kt.kind ILIKE '%v%'
  AND mi1.info_type_id IN ('4')
  AND mi1.info ILIKE '%f%'
  AND cn.name ILIKE '%film%'
  AND rt.role IN ('actor',
                   'actress',
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