
SELECT pc.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM
  (SELECT n.id,
          n.gender
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE pi.info ILIKE '%13%'
     AND it2.id IN ('23')) AS pc
JOIN cast_info AS ci ON pc.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1945 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')) AS ft ON ci.movie_id = ft.id
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('actress',
                   'composer',
                   'editor',
                   'miscellaneous crew',
                   'writer')
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     JOIN info_type AS it1 ON mi1.info_type_id = it1.id
     WHERE mi1.movie_id = ft.id
       AND it1.id IN ('6')
       AND mi1.info ILIKE '%dts%')
GROUP BY pc.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;