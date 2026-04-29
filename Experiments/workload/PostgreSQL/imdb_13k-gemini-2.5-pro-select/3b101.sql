 
 WITH filtered_cast AS
  (SELECT ci.movie_id,
          n.name
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.name_pcode_nf ILIKE '%o%'
     AND rt.role IN ('actor',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
SELECT t.title,
       fc.name,
       cn.name,
       COUNT(*)
FROM filtered_cast AS fc
JOIN title AS t ON fc.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%fes%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND cn.name ILIKE '%film%'
GROUP BY t.title,
         fc.name,
         cn.name
ORDER BY COUNT(*) DESC