
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
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer')
  AND t.title ILIKE '%miss%'
  AND n.name_pcode_nf ILIKE '%s%'
  AND cn.name ILIKE '%prod%'
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC