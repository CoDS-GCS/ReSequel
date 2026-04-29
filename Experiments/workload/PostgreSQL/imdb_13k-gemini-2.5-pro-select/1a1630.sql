 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 + 1 AND 1990
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('Australia',
                   'East Germany',
                   'India',
                   'Italy')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('English',
                   'German',
                   'Hindi',
                   'Italian')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer',
                  'producer')) AS ci ON t.id = ci.movie_id;