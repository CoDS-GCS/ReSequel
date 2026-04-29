 
 WITH t_filtered AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     mi1_counts AS
  (SELECT mi1.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi1
   WHERE mi1.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')
   GROUP BY mi1.movie_id),
     mi2_counts AS
  (SELECT mi2.movie_id,
          COUNT(*) AS ct
   FROM movie_info AS mi2
   WHERE mi2.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
     AND mi2.info_type_id IN ('4')
     AND mi2.info IN ('Danish',
                    'Dutch',
                    'English',
                    'Filipino',
                    'French',
                    'Greek',
                    'Italian',
                    'Japanese',
                    'Serbo-Croatian')
   GROUP BY mi2.movie_id),
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
     AND rt.role IN ('editor',
                   'writer')
   GROUP BY ci.movie_id),
     mk_counts AS
  (SELECT mk.movie_id,
          COUNT(*) AS ct
   FROM movie_keyword AS mk
   WHERE mk.movie_id IN
       (SELECT movie_id
        FROM t_filtered)
   GROUP BY mk.movie_id)
SELECT SUM(mi1.ct * mi2.ct * ci.ct * mk.ct)
FROM mi1_counts AS mi1
JOIN mi2_counts AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN ci_counts AS ci ON mi1.movie_id = ci.movie_id
JOIN mk_counts AS mk ON mi1.movie_id = mk.movie_id;