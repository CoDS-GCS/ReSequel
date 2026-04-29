WITH movie_person_base AS
  (SELECT n.gender,
          ci.role_id,
          ci.movie_id
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   JOIN cast_info AS ci ON n.id = ci.person_id
   WHERE pi.info ILIKE '%1935%'
     AND it2.id IN ('23'))
SELECT mpb.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM movie_person_base AS mpb
JOIN role_type AS rt ON mpb.role_id = rt.id
JOIN title AS t ON mpb.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'producer')
  AND t.production_year BETWEEN 1875 AND 1945
  AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'video game',
                   'video movie')
  AND mi1.info ILIKE '%dol%'
  AND it1.id IN ('6')
GROUP BY mpb.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;