WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'tv mini series',
                   'tv series',
                   'video game')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew'))
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
WHERE mi1.info_type_id IN ('16')
  AND pi.info_type_id IN ('23')
  AND mi1.info ILIKE '%es%'
  AND pi.info ILIKE '%16%'
GROUP BY mi1.info,
         pi.info;