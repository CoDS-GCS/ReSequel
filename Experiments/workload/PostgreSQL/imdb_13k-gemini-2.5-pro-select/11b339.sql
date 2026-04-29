WITH movie_candidates AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie') INTERSECT SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('6')
     AND mi1.info ILIKE '%dts%'),
     person_candidates AS
  (SELECT n.id,
          n.gender
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE pi.info ILIKE '%feb%'
     AND it2.id IN ('21'))
SELECT pc.gender,
       rt.role,
       cn.name,
       COUNT(*)
FROM movie_candidates AS mc_cand
JOIN cast_info AS ci ON mc_cand.id = ci.movie_id
JOIN person_candidates AS pc ON ci.person_id = pc.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON mc_cand.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'production designer')
GROUP BY pc.gender,
         rt.role,
         cn.name
ORDER BY COUNT(*) DESC;