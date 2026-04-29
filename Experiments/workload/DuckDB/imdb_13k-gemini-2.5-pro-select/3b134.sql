WITH filtered_titles AS
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%my%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   WHERE n.name_pcode_cf ILIKE '%e64%'),
     filtered_companies AS
  (SELECT cn.id,
          cn.name
   FROM company_name AS cn
   WHERE cn.name ILIKE '%pr%')
SELECT ft.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN filtered_companies AS fc ON mc.company_id = fc.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY ft.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC