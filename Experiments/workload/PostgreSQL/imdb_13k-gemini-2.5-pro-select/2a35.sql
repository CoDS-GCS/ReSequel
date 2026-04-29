 
 WITH t_filtered AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     mi_counts AS
  (SELECT movie_id,
          COUNT(*) FILTER (
                           WHERE info_type_id IN ('2')
                             AND info IN ('Black and White',
                    'Color')) AS ct1,
          COUNT(*) FILTER (
                           WHERE info_type_id IN ('4')
                             AND info IN ('Cantonese',
                    'English',
                    'German',
                    'Hebrew',
                    'Hungarian',
                    'Italian',
                    'None',
                    'Norwegian',
                    'Polish',
                    'Portuguese')) AS ct2
   FROM movie_info
   WHERE movie_id IN
       (SELECT movie_id
        FROM t_filtered)
   GROUP BY movie_id),
     ci_counts AS
  (SELECT ci.movie_id,
          COUNT(*) AS ct
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE ci.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND (n.gender IN ('m')
          OR n.gender IS NULL)
     AND rt.role IN ('miscellaneous crew')
   GROUP BY ci.movie_id),
     mk_counts AS
  (SELECT mk.movie_id,
          COUNT(*) AS ct
   FROM movie_keyword AS mk
   WHERE mk.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
   GROUP BY mk.movie_id)
SELECT SUM(mi.ct1 * mi.ct2 * ci.ct * mk.ct)
FROM t_filtered t
JOIN mi_counts mi ON t.movie_id = mi.movie_id
JOIN ci_counts ci ON t.movie_id = ci.movie_id
JOIN mk_counts mk ON t.movie_id = mk.movie_id
WHERE mi.ct1 > 0
  AND mi.ct2 > 0;