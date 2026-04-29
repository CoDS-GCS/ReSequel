
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON ci.movie_id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'producer')
  AND cn.name ILIKE '%film%'
  AND EXISTS
    (SELECT 1
     FROM title AS t
     JOIN kind_type AS kt ON t.kind_id = kt.id
     WHERE t.id = ci.movie_id
       AND t.production_year BETWEEN 1945 AND 1990
       AND kt.kind ILIKE '%s%')
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = ci.movie_id
       AND mi1.info_type_id IN ('3')
       AND mi1.info ILIKE '%mus%')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;