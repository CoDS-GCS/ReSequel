
SELECT t.title,
       n.name,
       cn.name,
       COUNT(*)
FROM
  (SELECT id,
          title
   FROM title
   WHERE title ILIKE '%ha%'
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name_pcode_nf ILIKE '%r53%') AS n ON ci.person_id = n.id
JOIN
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
                   'producer',
                   'production designer')) AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN
  (SELECT id,
          name
   FROM company_name
   WHERE name ILIKE '%repu%') AS cn ON mc.company_id = cn.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
GROUP BY t.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC;