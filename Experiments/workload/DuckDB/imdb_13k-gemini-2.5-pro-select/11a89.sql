WITH title_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1945
     AND kt.kind ILIKE '%vi%'),
     info_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('3')
     AND mi1.info ILIKE '%ne%')
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON ci.movie_id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE ci.movie_id IN
    (SELECT id
     FROM title_movies)
  AND ci.movie_id IN
    (SELECT movie_id
     FROM info_movies)
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'producer')
  AND cn.name ILIKE '%na%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;