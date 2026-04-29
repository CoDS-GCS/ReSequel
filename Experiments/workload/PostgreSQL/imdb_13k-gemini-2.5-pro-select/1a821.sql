 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Drama',
                   'Thriller')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:M',
                   'Iceland:16',
                   'Iceland:L',
                   'Portugal:M/12',
                   'Sweden:15',
                   'Sweden:Btl',
                   'UK:15',
                   'USA:R',
                   'West Germany:12')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1950 + 1 AND 1990
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie');