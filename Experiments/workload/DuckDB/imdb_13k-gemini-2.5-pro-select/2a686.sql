WITH t_ci AS
  (SELECT t.id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('costume designer')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv series',
                   'video game')
   WHERE t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('5')
AND mi1.info IN ('Finland:(Banned)',
                    'Finland:K-16',
                    'Finland:K-18',
                    'France:U',
                    'India:U',
                    'Sweden:11',
                    'UK:12',
                    'USA:PG-13',
                    'USA:TV-G',
                    'West Germany:16',
                    'West Germany:18',
                    'West Germany:6')
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('4')
AND mi2.info IN ('English',
                    'French',
                    'German',
                    'Italian',
                    'Telugu')
JOIN movie_keyword AS mk ON t_ci.id = mk.movie_id;