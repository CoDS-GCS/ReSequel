
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%no%'
  AND kt.kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie')
  AND n.name_pcode_cf ILIKE '%r2%'
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'writer')
  AND cn.name ILIKE '%mila%'
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC