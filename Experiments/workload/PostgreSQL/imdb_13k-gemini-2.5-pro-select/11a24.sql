WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON kt.id = t.kind_id
   WHERE kt.kind ILIKE '%m%'
     AND t.production_year BETWEEN 1990 AND 2015)
SELECT n.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM filtered_titles ft
JOIN cast_info ci ON ft.id = ci.movie_id
JOIN name n ON ci.person_id = n.id
JOIN role_type rt ON ci.role_id = rt.id
JOIN movie_companies mc ON ft.id = mc.movie_id
JOIN company_name cn ON mc.company_id = cn.id
WHERE rt.role IN ('composer',
                   'editor',
                   'guest',
                   'producer',
                   'writer')
  AND cn.name ILIKE '%b.%'
  AND EXISTS
    (SELECT 1
     FROM movie_info mi1
     WHERE mi1.movie_id = ft.id
       AND mi1.info_type_id IN ('5')
       AND mi1.info ILIKE '%swe%')
GROUP BY n.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;