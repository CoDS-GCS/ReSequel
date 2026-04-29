WITH cast_details AS
  (SELECT ci.movie_id,
          n.gender,
          rt.role
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer',
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind ILIKE '%ser%'
  AND mi1.info_type_id IN ('8')
  AND mi1.info ILIKE '%s%'
  AND cn.name ILIKE '%box%'
GROUP BY cd.gender,
         cd.role,
         cn.name
ORDER BY COUNT(*) DESC;