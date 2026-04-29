
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON kt.id = t.kind_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'miscellaneous crew',
                   'producer')
  AND t.title ILIKE '%th%'
  AND n.name_pcode_nf ILIKE '%n2%'
  AND cn.name ILIKE '%run%'
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC