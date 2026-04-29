
SELECT ft.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%nom%'
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')) AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN
  (SELECT n.id,
          n.name
   FROM name AS n
   WHERE n.name_pcode_cf ILIKE '%m3%') AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN
  (SELECT cn.id,
          cn.name
   FROM company_name AS cn
   WHERE cn.name ILIKE '%vide%') AS fc ON mc.company_id = fc.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY ft.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC