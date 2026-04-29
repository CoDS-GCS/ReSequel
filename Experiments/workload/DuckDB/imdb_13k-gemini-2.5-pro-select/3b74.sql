WITH filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name ILIKE '%nati%')
SELECT t.title,
       n.name,
       fcomp.name,
       COUNT(*)
FROM filtered_companies AS fcomp
JOIN title AS t ON fcomp.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.title ILIKE '%ben%'
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.name_pcode_nf ILIKE '%n65%'
  AND rt.role IN ('actor',
                   'cinematographer',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY t.title,
         n.name,
         fcomp.name
ORDER BY COUNT(*) DESC