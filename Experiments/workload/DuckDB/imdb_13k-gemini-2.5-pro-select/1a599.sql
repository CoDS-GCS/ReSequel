WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
     AND mi1.info_type_id = '3'
     AND mi1.info IN ('Documentary',
                   'Drama',
                   'Family',
                   'Romance',
                   'Thriller')
     AND mi2.info_type_id = '5'
     AND mi2.info IN ('Australia:PG',
                   'Canada:14A',
                   'Canada:PG',
                   'Iceland:16',
                   'Portugal:M/12',
                   'South Korea:15',
                   'UK:U',
                   'USA:PG'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('f')
  AND rt.role IN ('director',
                  'writer');