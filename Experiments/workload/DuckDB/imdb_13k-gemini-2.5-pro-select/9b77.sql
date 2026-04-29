
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND it1.id IN ('3',
                  '5',
                  '8')
  AND it2.id IN ('34')
  AND mi1.info IN ('Brazil:Livre',
                    'Canada:G',
                    'Canada:PG',
                    'Czech Republic',
                    'Finland',
                    'Germany:6',
                    'Netherlands:16',
                    'Singapore',
                    'South Africa',
                    'South Korea:12',
                    'West Germany:12')
  AND n.name ILIKE '%che%'
GROUP BY mi1.info,
         n.name;