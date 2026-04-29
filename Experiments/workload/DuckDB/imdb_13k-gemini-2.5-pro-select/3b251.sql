
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.title ILIKE '%11%'
  AND n.name_pcode_nf ILIKE '%e62%'
  AND cn.name ILIKE '%ngtv%'
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'production designer'))
  AND t.id IN
    (SELECT movie_id
     FROM movie_keyword)
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;