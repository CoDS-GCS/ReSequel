WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind ILIKE '%m%')
     AND EXISTS
       (SELECT 1
        FROM movie_info mi
        WHERE mi.movie_id = t.id
          AND mi.info_type_id IN ('6')
          AND mi.info ILIKE '%ste%'))
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM movie_info AS mi1
JOIN filtered_movies AS fm ON mi1.movie_id = fm.id
JOIN cast_info AS ci ON fm.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON fm.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('composer',
                   'guest',
                   'writer')
  AND mi1.info_type_id IN ('6')
  AND mi1.info ILIKE '%ste%'
  AND cn.name ILIKE '%uni%'
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;