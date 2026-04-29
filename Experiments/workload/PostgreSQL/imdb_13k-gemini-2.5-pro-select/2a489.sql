 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND t.production_year BETWEEN 1950 AND 1990),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IS NULL
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('production designer')),
     filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('3')
     AND info IN ('Adult',
                    'Adventure',
                    'Animation',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Fantasy',
                    'Music',
                    'Short')),
     filtered_mi2 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Black and White',
                    'Color'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;