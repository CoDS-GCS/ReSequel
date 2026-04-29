 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 + 1 AND 2015
     AND kt.kind IN ('video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Adult',
                   'Animation',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Horror',
                   'Mystery',
                   'Romance')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:G',
                   'Australia:M',
                   'Australia:MA',
                   'Australia:PG',
                   'Canada:PG',
                   'Germany:12',
                   'Hong Kong:IIB',
                   'South Korea:18',
                   'UK:12',
                   'UK:15',
                   'USA:Unrated')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('producer',
                  'writer')) AS ci ON t.id = ci.movie_id;