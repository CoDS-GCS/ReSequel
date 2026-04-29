
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.title ILIKE '%perso%'
  AND n.name_pcode_nf ILIKE '%k4%'
  AND cn.name ILIKE '%d%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
  AND rt.role IN ('actor',
                   'miscellaneous crew',
                   'writer')
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;