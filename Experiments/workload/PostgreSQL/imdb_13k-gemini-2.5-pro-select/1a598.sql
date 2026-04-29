 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Animation',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Romance',
                   'Thriller',
                   'Western')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:PG',
                   'Finland:K-16',
                   'Finland:S',
                   'Germany:12',
                   'Netherlands:12',
                   'Netherlands:AL',
                   'Singapore:NC-16',
                   'UK:18',
                   'USA:Approved',
                   'USA:G',
                   'USA:PG',
                   'USA:Passed')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1925 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game');