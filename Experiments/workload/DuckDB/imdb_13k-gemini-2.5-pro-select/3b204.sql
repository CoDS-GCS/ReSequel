WITH filtered_titles AS
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%jona%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie'))
SELECT ft.title,
       n.name,
       cn.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.name_pcode_cf ILIKE '%l2%'
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name ILIKE '%e%'
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY ft.title,
         n.name,
         cn.name
ORDER BY COUNT(*) DESC