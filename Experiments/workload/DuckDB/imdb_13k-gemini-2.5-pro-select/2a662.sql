WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('16')
     AND mi1.info IN ('USA:2002',
                    'USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2010',
                    'USA:2011',
                    'USA:2012',
                    'USA:2013')),
     mi2_filtered AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('8')
     AND mi2.info IN ('USA')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('costume designer',
                   'editor'))
     AND n.gender IN ('f')
   UNION ALL SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('costume designer',
                   'editor'))
     AND n.gender IS NULL)
SELECT COUNT(*)
FROM t_filtered t
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
JOIN ci_filtered ci ON t.id = ci.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;