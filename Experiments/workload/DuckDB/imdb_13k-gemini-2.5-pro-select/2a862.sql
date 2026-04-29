WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('3')
     AND mi1.info IN ('Action',
                    'Crime',
                    'Drama',
                    'Thriller')),
     mi2_filtered AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('5')
     AND mi2.info IN ('Australia:MA',
                    'Iceland:16',
                    'Netherlands:16',
                    'Norway:15',
                    'South Korea:18',
                    'UK:18',
                    'UK:PG')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('cinematographer',
                   'miscellaneous crew'))
     AND n.gender IN ('m')
   UNION ALL SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('cinematographer',
                   'miscellaneous crew'))
     AND n.gender IS NULL)
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;