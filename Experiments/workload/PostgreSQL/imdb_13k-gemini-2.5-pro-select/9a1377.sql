WITH filtered_people AS
  (SELECT n.id AS person_id,
          pi.info
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE it2.id IN ('21')
     AND pi.info ILIKE '%19%'),
     filtered_movies AS
  (SELECT t.id AS movie_id,
          mi1.info
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE it1.id IN ('16')
     AND mi1.info ILIKE '%li%'
     AND kt.kind IN ('movie',
                   'tv mini series',
                   'video movie'))
SELECT fm.info,
       fp.info,
       COUNT(*)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN filtered_people AS fp ON ci.person_id = fp.person_id
JOIN filtered_movies AS fm ON ci.movie_id = fm.movie_id
WHERE rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
GROUP BY fm.info,
         fp.info;