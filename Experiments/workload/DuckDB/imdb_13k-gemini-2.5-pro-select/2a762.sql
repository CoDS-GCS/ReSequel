WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('8')
   AND mi1.info IN ('France',
                    'Italy',
                    'Netherlands',
                    'Spain',
                    'UK',
                    'USA')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('5')
   AND mi2.info IN ('France:X',
                    'Germany:12',
                    'Germany:16',
                    'Netherlands:AL',
                    'Singapore:PG',
                    'Spain:18',
                    'Switzerland:10',
                    'Switzerland:12',
                    'West Germany:16',
                    'West Germany:18')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv movie',
                   'video game')
   WHERE t.production_year BETWEEN 1925 AND 2015)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'production designer')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;