
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
                   'Adventure',
                   'Animation',
                   'Comedy',
                   'Drama',
                   'Fantasy')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Argentina:16',
                   'Canada:G',
                   'Canada:PG',
                   'Germany:6',
                   'Germany:o.Al.',
                   'New Zealand:R16',
                   'Portugal:M/16',
                   'Singapore:PG',
                   'Spain:T',
                   'Switzerland:16',
                   'UK:12',
                   'UK:15',
                   'UK:U')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('miscellaneous crew')) AS ci ON t.id = ci.movie_id;