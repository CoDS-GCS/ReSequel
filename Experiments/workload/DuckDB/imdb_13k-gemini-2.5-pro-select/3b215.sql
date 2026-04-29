
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.name_pcode_cf ILIKE '%g52%'
  AND rt.role IN ('composer',
                   'costume designer',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND t.title ILIKE '%pl%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND cn.name ILIKE '%bro%'
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC