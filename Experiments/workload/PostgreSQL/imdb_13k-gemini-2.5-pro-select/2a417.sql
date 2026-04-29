 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE it1.id IN ('5')
  AND it2.id IN ('8')
  AND mi1.info IN ('Australia:PG',
                    'UK:PG',
                    'USA:G',
                    'USA:R',
                    'USA:Unrated',
                    'West Germany:16')
  AND mi2.info IN ('UK',
                    'USA',
                    'West Germany')
  AND rt.role IN ('costume designer',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);