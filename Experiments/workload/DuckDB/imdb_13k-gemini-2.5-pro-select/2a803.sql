WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('5')
   AND mi1.info IN ('Argentina:Atp',
                    'Finland:K-16',
                    'Sweden:15',
                    'UK:U',
                    'USA:Approved',
                    'USA:Passed',
                    'West Germany:16')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('3')
   AND mi2.info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'Romance',
                    'Short')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
   WHERE t.production_year BETWEEN 1925 AND 1975)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'costume designer')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;