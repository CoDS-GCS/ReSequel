 
 
SELECT t_filtered.title,
       ci_filtered.name,
       mc_filtered.name,
       COUNT(*)
FROM
  (SELECT t.id,
          t.title
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.title ILIKE '%hir%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')) AS t_filtered
JOIN
  (SELECT ci.movie_id,
          n.name
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.name_pcode_nf ILIKE '%m%'
     AND rt.role IN ('costume designer',
                   'miscellaneous crew',
                   'producer')) AS ci_filtered ON t_filtered.id = ci_filtered.movie_id
JOIN
  (SELECT mc.movie_id,
          cn.name
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name ILIKE '%pic%') AS mc_filtered ON t_filtered.id = mc_filtered.movie_id
JOIN movie_keyword AS mk ON t_filtered.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
GROUP BY t_filtered.title,
         ci_filtered.name,
         mc_filtered.name
ORDER BY COUNT(*) DESC