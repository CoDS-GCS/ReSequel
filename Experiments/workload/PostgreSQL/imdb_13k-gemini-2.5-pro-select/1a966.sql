 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')) AS t
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
     AND info IN ('Argentina:16',
                   'Australia:PG',
                   'Germany:18',
                   'Iceland:L',
                   'Ireland:15A',
                   'Italy:T',
                   'Netherlands:AL',
                   'Spain:18',
                   'Spain:T',
                   'Sweden:11',
                   'Sweden:15',
                   'Switzerland:10',
                   'UK:12')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('writer')) AS ci ON t.id = ci.movie_id;