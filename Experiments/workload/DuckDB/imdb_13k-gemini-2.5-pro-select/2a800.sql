WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('18')
   AND mi1.info IN ('Mexico',
                    'New York, USA',
                    'Rome, Lazio, Italy',
                    'Vancouver, British Columbia, Canada')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('3')
   AND mi2.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Thriller')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
   WHERE t.production_year BETWEEN 1925 AND 2015)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;