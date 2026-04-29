
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
WHERE t.title ILIKE '%boy%'
  AND n.name_pcode_nf ILIKE '%n52%'
  AND cn.name ILIKE '%bo%'
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;