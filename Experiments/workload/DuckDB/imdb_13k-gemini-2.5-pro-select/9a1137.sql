WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
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
WHERE mi1.info_type_id IN ('108')
  AND pi.info_type_id IN ('37')
  AND mi1.info ILIKE '%13%'
  AND pi.info ILIKE '%de%'
GROUP BY mi1.info,
         pi.info;