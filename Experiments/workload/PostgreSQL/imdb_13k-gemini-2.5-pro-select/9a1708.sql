
SELECT mi1.info,
       pi.info,
       COUNT(*)
FROM
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer')) AS f_ci
JOIN
  (SELECT n.id AS person_id,
          pi.info
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE it2.id IN ('28')
     AND pi.info ILIKE '%la%') AS pi ON f_ci.person_id = pi.person_id
JOIN
  (SELECT t.id AS movie_id,
          mi1.info
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE it1.id IN ('7')
     AND mi1.info ILIKE '%me%'
     AND kt.kind IN ('episode',
                   'movie',
                   'tv mini series',
                   'tv movie',
                   'tv series',
                   'video game')) AS mi1 ON f_ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         pi.info;