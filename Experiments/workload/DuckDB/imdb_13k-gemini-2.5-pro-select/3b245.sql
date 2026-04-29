
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
AND ci.role_id IN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'producer',
                   'writer'))
JOIN name AS n ON ci.person_id = n.id
AND n.name_pcode_cf ILIKE '%r2%'
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name ILIKE '%mila%'
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%no%'
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie'))
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC