WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv series',
                   'video game',
                   'video movie')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'guest',
                   'writer')),
     base_ci AS
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN title AS t ON ci.movie_id = t.id
   WHERE ci.role_id IN
       (SELECT id
        FROM filtered_rt)
     AND t.kind_id IN
       (SELECT id
        FROM filtered_kt))
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM base_ci
JOIN name AS n ON base_ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
JOIN movie_info AS mi1 ON base_ci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE it1.id IN ('16')
  AND it2.id IN ('21')
  AND mi1.info ILIKE '%th%'
  AND pi.info ILIKE '%19%'
GROUP BY mi1.info,
         pi.info;