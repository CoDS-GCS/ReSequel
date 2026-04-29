
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN person_info AS pi ON n.id = pi.person_id
INNER JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('3',
                  '5',
                  '6')
  AND mi1.info IN ('Argentina:Atp',
                    'Germany:12',
                    'Iceland:12',
                    'Iceland:16',
                    'News',
                    'Reality-TV',
                    'UK:PG',
                    'USA:G',
                    'USA:Unrated',
                    'War')
  AND rt.role IN ('costume designer',
                   'miscellaneous crew',
                   'producer')
  AND n.name ILIKE '%ra%'
  AND it2.id IN ('15')
GROUP BY mi1.info,
         n.name;