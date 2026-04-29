
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON kt.id = t.kind_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE kt.kind IN ('tv movie',
                   'video game',
                   'video movie')
  AND t.production_year BETWEEN 1950 AND 1990
  AND it1.id IN ('2',
                  '5')
  AND mi1.info IN ('Australia:PG',
                    'UK:PG',
                    'USA:PG',
                    'USA:Unrated')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'producer')
  AND n.name ILIKE '%po%'
  AND it2.id IN ('35')
GROUP BY mi1.info,
         n.name;