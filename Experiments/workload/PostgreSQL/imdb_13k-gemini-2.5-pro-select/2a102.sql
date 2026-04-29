 
 WITH t_ci AS
  (SELECT t.id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('costume designer')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
   WHERE t.production_year BETWEEN 1875 AND 1975)
SELECT COUNT(*)
FROM t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('17')
AND mi1.info IN ('One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('8')
AND mi2.info IN ('USA')
JOIN movie_keyword AS mk ON t_ci.id = mk.movie_id;