 
 WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('2')
   AND mi1.info IN ('Color')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('5')
   AND mi2.info IN ('Canada:18A',
                    'Chile:18',
                    'Chile:TE',
                    'Finland:K-11',
                    'France:-12',
                    'Italy:VM14',
                    'Malaysia:U',
                    'Mexico:B',
                    'New Zealand:R16',
                    'Peru:14',
                    'Philippines:R-18',
                    'Singapore:PG13',
                    'Switzerland:10',
                    'Switzerland:14',
                    'Switzerland:16')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
   WHERE t.production_year BETWEEN 1975 AND 2015)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'director')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;