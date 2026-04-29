 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('Brazil',
                   'Czechoslovakia',
                   'Denmark',
                   'East Germany',
                   'Finland',
                   'France',
                   'India',
                   'Japan',
                   'Soviet Union',
                   'Sweden',
                   'Yugoslavia')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('Czech',
                   'Danish',
                   'Finnish',
                   'French',
                   'German',
                   'Hindi',
                   'Japanese',
                   'Portuguese',
                   'Russian',
                   'Serbo-Croatian',
                   'Swedish')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')),
     t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 1975
     AND kt.kind IN ('episode',
                  'movie',
                  'tv movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id;