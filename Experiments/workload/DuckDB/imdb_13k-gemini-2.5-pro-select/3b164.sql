WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   WHERE n.name_pcode_cf ILIKE '%m21%'),
     filtered_companies AS
  (SELECT cn.id,
          cn.name
   FROM company_name AS cn
   WHERE cn.name ILIKE '%some%')
SELECT t.title,
       fp.name,
       fc.name,
       COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'production designer')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN filtered_companies AS fc ON mc.company_id = fc.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%th%'
GROUP BY t.title,
         fp.name,
         fc.name
ORDER BY COUNT(*) DESC