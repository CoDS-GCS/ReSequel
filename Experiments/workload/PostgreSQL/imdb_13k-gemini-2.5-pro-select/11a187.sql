
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON ci.movie_id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND cn.name ILIKE '%co%'
  AND EXISTS
    (SELECT 1
     FROM title AS t
     JOIN kind_type AS kt ON t.kind_id = kt.id
     WHERE t.id = ci.movie_id
       AND t.production_year BETWEEN 1875 AND 1945
       AND kt.kind ILIKE '%s%')
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = ci.movie_id
       AND mi1.info_type_id IN ('8')
       AND mi1.info ILIKE '%usa%')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;