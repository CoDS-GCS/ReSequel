WITH filtered_pi AS
  (SELECT pi.person_id,
          pi.info
   FROM person_info AS pi
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE it2.id IN ('29')
     AND pi.info ILIKE '%es%'),
     filtered_mi1 AS
  (SELECT mi1.movie_id,
          mi1.info
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('108')
     AND mi1.info ILIKE '%20%')
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN filtered_pi AS pi ON n.id = pi.person_id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
WHERE rt.role IN ('actress',
                   'composer',
                   'guest',
                   'miscellaneous crew')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
GROUP BY mi1.info,
         pi.info;