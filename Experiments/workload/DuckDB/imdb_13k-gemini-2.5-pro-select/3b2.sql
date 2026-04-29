WITH filtered_movies AS
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%1997%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie')
     AND EXISTS
       (SELECT 1
        FROM movie_keyword mk
        WHERE mk.movie_id = t.id))
SELECT fm.title,
       n.name,
       cn.name,
       COUNT(*)
FROM filtered_movies AS fm
JOIN cast_info AS ci ON fm.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON fm.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE n.name_pcode_nf ILIKE '%d%'
  AND cn.name ILIKE '%wa%'
  AND rt.role IN ('composer',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY fm.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;