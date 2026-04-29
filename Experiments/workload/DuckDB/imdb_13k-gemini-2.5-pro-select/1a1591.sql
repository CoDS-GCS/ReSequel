WITH t_ci_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 1875 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
     AND n.gender IN ('f',
                   'm')
     AND rt.role IN ('composer',
                  'editor'))
SELECT COUNT(*)
FROM t_ci_filtered AS t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
WHERE mi1.info_type_id = '8'
  AND mi1.info IN ('Argentina',
                   'Mexico',
                   'Spain')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Spanish');