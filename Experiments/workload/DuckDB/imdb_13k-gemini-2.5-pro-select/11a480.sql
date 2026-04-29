WITH filtered_roles AS
  (SELECT id,
          ROLE
   FROM role_type
   WHERE ROLE IN ('costume designer',
                   'producer',
                   'production designer',
                   'writer')),
     filtered_kinds AS
  (SELECT id
   FROM kind_type
   WHERE kind ILIKE '%s%')
SELECT n.gender,
       fr.role,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN filtered_kinds AS fk ON t.kind_id = fk.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1945 AND 1990
  AND mi1.info_type_id IN ('4')
  AND mi1.info ILIKE '%ben%'
  AND cn.name ILIKE '%vi%'
GROUP BY n.gender,
         fr.role,
         cn.name
ORDER BY COUNT(*) DESC;