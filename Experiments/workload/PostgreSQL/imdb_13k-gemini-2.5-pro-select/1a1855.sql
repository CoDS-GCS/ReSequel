 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('Albania',
                   'Cuba',
                   'Denmark',
                   'Georgia',
                   'Germany',
                   'Israel',
                   'Mexico',
                   'Venezuela')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('Albanian',
                   'English',
                   'Georgian',
                   'Spanish')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('costume designer',
                  'production designer')),
     t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('episode',
                  'movie',
                  'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id;