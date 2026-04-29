 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 + 1 AND 2015
     AND kt.kind IN ('episode',
                  'movie',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Thriller')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Argentina:13',
                   'Australia:MA',
                   'France:U',
                   'Germany:16',
                   'Germany:18',
                   'Norway:15',
                   'Portugal:M/12',
                   'South Korea:18',
                   'Spain:18',
                   'Sweden:15',
                   'Switzerland:14',
                   'USA:R')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('cinematographer',
                  'writer')) AS ci ON t.id = ci.movie_id;