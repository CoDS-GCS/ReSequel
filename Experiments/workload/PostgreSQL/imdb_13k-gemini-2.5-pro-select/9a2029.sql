WITH filtered_movies AS
  (SELECT t.id AS movie_id,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE kt.kind IN ('episode',
                   'tv mini series',
                   'tv series',
                   'video game')
     AND mi1.info_type_id IN ('16')
     AND mi1.info ILIKE '%hun%'),
     filtered_persons AS
  (SELECT n.id AS person_id,
          pi.info
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE pi.info_type_id IN ('23')
     AND pi.info ILIKE '%193%')
SELECT fm.info,
       fp.info,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_movies AS fm ON ci.movie_id = fm.movie_id
JOIN filtered_persons AS fp ON ci.person_id = fp.person_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'editor',
                   'guest',
                   'producer',
                   'production designer',
                   'writer'))
GROUP BY fm.info,
         fp.info;