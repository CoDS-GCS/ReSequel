WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 2015
     AND kt.kind ILIKE '%m%' INTERSECT SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info ILIKE '%dig%')
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM filtered_movies AS fm
JOIN movie_companies AS mc ON fm.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name ILIKE '%long%'
JOIN cast_info AS ci ON fm.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'editor',
                   'guest')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;