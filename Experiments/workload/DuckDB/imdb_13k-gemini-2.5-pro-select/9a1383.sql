WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')),
     filtered_it1 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('16')),
     filtered_it2 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('23'))
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info ILIKE '%thai%'
JOIN filtered_it1 ON mi1.info_type_id = filtered_it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
AND pi.info ILIKE '%191%'
JOIN filtered_it2 ON pi.info_type_id = filtered_it2.id
GROUP BY mi1.info,
         pi.info;