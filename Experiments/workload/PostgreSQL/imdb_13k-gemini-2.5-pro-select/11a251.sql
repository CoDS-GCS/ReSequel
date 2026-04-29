WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
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
WHERE mi1.info_type_id IN ('5')
  AND mi1.info ILIKE '%bra%'
  AND cn.name ILIKE '%vi%'
  AND rt.role IN ('actor',
                   'actress',
                   'costume designer',
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