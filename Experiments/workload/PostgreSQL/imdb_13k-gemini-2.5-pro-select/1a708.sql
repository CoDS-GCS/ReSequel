 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Musical',
                   'Short',
                   'Thriller')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '5'
     AND info IN ('Australia:G',
                   'Australia:PG',
                   'Australia:R',
                   'Brazil:Livre',
                   'Germany:12',
                   'Italy:VM14',
                   'Netherlands:16',
                   'Norway:16',
                   'Singapore:M18',
                   'Singapore:R21',
                   'UK:12A',
                   'USA:Unrated',
                   'West Germany:16',
                   'West Germany:6')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor')),
     t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('episode',
                  'movie',
                  'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id;