
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON cn.id = mc.company_id
JOIN kind_type AS kt ON kt.id = t.kind_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.title ILIKE '%bonn%'
  AND n.name_pcode_nf ILIKE '%m65%'
  AND cn.name ILIKE '%b%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'production designer')
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;