
SELECT ft.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%brea%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video movie')) AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN
  (SELECT n.id,
          n.name
   FROM name AS n
   WHERE n.name_pcode_cf ILIKE '%s42%') AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'costume designer',
                   'producer',
                   'writer')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN
  (SELECT cn.id,
          cn.name
   FROM company_name AS cn
   WHERE cn.name ILIKE '%broa%') AS fc ON mc.company_id = fc.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY ft.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC