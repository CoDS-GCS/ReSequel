 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Family')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:R',
                   'Canada:PG',
                   'Finland:K-18',
                   'Iceland:16',
                   'Norway:15',
                   'Norway:16',
                   'Portugal:M/12',
                   'UK:18',
                   'UK:PG',
                   'UK:X',
                   'USA:Approved',
                   'West Germany:16')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')),
     t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 + 1 AND 1990
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id;