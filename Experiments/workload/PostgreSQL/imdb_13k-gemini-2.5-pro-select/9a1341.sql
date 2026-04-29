WITH filtered_movies AS
  (SELECT mi.movie_id,
          mi.info
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('90')
     AND mi.info ILIKE '%de%'
     AND EXISTS
       (SELECT 1
        FROM title AS t
        WHERE t.id = mi.movie_id
          AND t.kind_id IN
            (SELECT id
             FROM kind_type
             WHERE kind IN ('movie',
                   'tv mini series',
                   'tv movie',
                   'video movie')))),
     filtered_persons AS
  (SELECT pi.person_id,
          pi.info
   FROM person_info AS pi
   WHERE pi.info_type_id IN ('29')
     AND pi.info ILIKE '%co%')
SELECT fm.info,
       fp.info,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_movies AS fm ON ci.movie_id = fm.movie_id
JOIN filtered_persons AS fp ON ci.person_id = fp.person_id
WHERE ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
GROUP BY fm.info,
         fp.info;