WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON kt.id = t.kind_id
   WHERE kt.kind ILIKE '%v%'
     AND t.production_year BETWEEN 1990 AND 2015)
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON cn.id = mc.company_id
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
WHERE rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND mi1.info_type_id IN ('4')
  AND mi1.info ILIKE '%ger%'
  AND cn.name ILIKE '%go%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;