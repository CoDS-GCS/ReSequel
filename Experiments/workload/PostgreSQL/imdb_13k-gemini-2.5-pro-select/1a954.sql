 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('movie',
                  'video movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Adventure',
                   'Drama',
                   'Family',
                   'Mystery',
                   'Romance',
                   'Thriller')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Argentina:16',
                   'Brazil:14',
                   'Canada:13+',
                   'Finland:K-16',
                   'France:-12',
                   'Hong Kong:IIB',
                   'Hong Kong:III',
                   'Ireland:15A',
                   'South Korea:All',
                   'Spain:13',
                   'UK:U')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actress')) AS ci ON t.id = ci.movie_id;