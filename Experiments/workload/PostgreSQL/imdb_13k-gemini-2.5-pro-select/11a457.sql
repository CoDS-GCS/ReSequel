WITH cast_details AS
  (SELECT ci.movie_id,
          n.gender,
          rt.role
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'producer',
                   'production designer',
                   'writer'))
SELECT cd.gender,
       cd.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN cast_details AS cd ON t.id = cd.movie_id
WHERE t.production_year BETWEEN 1875 AND 2015
  AND kt.kind ILIKE '%m%'
  AND mi1.info_type_id IN ('8')
  AND mi1.info ILIKE '%g%'
  AND cn.name ILIKE '%ca%'
GROUP BY cd.gender,
         cd.role,
         cn.name
ORDER BY COUNT(*) DESC;