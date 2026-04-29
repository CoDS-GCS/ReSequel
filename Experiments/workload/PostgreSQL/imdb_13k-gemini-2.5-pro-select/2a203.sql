 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('movie',
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
WHERE it1.id IN ('18')
  AND it2.id IN ('8')
  AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Mexico City, Distrito Federal, Mexico',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
  AND mi2.info IN ('Mexico',
                    'Spain',
                    'USA')
  AND rt.role IN ('miscellaneous crew',
                   'producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);