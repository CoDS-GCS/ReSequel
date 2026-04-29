
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
WHERE t.production_year BETWEEN 1945 AND 1990
  AND kt.kind ILIKE '%m%'
  AND mi1.info_type_id IN ('8')
  AND mi1.info ILIKE '%ja%'
  AND cn.name ILIKE '%br%'
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;