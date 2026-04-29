 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Adventure',
                   'Animation',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Short',
                   'Thriller',
                   'Western')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Argentina:Atp',
                   'Australia:M',
                   'Finland:K-16',
                   'Norway:16',
                   'Sweden:15',
                   'UK:A',
                   'UK:U',
                   'USA:Approved',
                   'USA:Passed',
                   'West Germany:12')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer')) AS ci ON t.id = ci.movie_id;