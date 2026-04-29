
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.name_pcode_cf ILIKE '%p25%'
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'producer',
                   'production designer')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name ILIKE '%un%'
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%auf%'
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC