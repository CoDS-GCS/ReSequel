WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1945
     AND kt.kind ILIKE '%m%')
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM movie_base AS mb
JOIN movie_info AS mi1 ON mb.id = mi1.movie_id
JOIN cast_info AS ci ON mb.id = ci.movie_id
JOIN movie_companies AS mc ON mb.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('8')
  AND mi1.info ILIKE '%usa%'
  AND cn.name ILIKE '%pi%'
  AND rt.role IN ('actor',
                   'actress',
                   'director',
                   'editor')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;