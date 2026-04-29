WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('5')
   AND mi1.info IN ('Argentina:Unrated',
                    'Australia:M',
                    'Canada:14A',
                    'Germany:6',
                    'Hong Kong:IIB',
                    'Iceland:16',
                    'Netherlands:16',
                    'Norway:15',
                    'UK:15',
                    'UK:18',
                    'USA:R')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('3')
   AND mi2.info IN ('Action',
                    'Comedy',
                    'Drama',
                    'Horror',
                    'Romance',
                    'Short',
                    'Thriller')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv movie',
                   'video game')
   WHERE t.production_year BETWEEN 1990 AND 2015)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;