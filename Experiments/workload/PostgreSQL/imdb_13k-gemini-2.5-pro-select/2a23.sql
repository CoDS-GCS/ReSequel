 
 WITH t_ci AS
  (SELECT t.id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('composer',
                   'costume designer')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
   WHERE t.production_year BETWEEN 1925 AND 2015)
SELECT COUNT(*)
FROM t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('18')
AND mi1.info IN ('London, England, UK',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA')
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('5')
AND mi2.info IN ('Australia:PG',
                    'Germany:16',
                    'Netherlands:12',
                    'Sweden:15',
                    'UK:15',
                    'USA:TV-14')
JOIN movie_keyword AS mk ON t_ci.id = mk.movie_id;