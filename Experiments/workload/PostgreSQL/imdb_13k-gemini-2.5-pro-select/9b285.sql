WITH filtered_persons AS
  (SELECT n.id,
          n.name
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   WHERE n.name ILIKE '%kr%'
     AND pi.info_type_id IN ('20')),
     filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie'))
SELECT mi1.info,
       fp.name,
       COUNT(*)
FROM cast_info AS ci
JOIN filtered_persons AS fp ON ci.person_id = fp.id
JOIN filtered_movies AS fm ON ci.movie_id = fm.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('3',
                  '4')
  AND mi1.info IN ('Crime',
                    'Danish',
                    'Documentary',
                    'Dutch',
                    'Family',
                    'Finnish',
                    'Musical',
                    'Swedish')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'production designer',
                   'writer')
GROUP BY mi1.info,
         fp.name;