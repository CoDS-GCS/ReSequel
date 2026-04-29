 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
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
                   'Family',
                   'Musical',
                   'Thriller')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Canada:G',
                   'France:U',
                   'Iceland:16',
                   'Italy:T',
                   'New Zealand:R16',
                   'Norway:16',
                   'Norway:18',
                   'Spain:13',
                   'Switzerland:14',
                   'USA:Approved',
                   'USA:PG',
                   'USA:Passed',
                   'USA:Unrated')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actress',
                  'composer')) AS ci ON t.id = ci.movie_id;