
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('8')
  AND mi1.info IN ('Bulgaria',
                    'Chile',
                    'Cuba',
                    'Cyprus',
                    'East Germany',
                    'Indonesia',
                    'Peru',
                    'Poland',
                    'Romania',
                    'Serbia',
                    'Slovenia',
                    'South Africa',
                    'Turkey',
                    'Venezuela')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director')
  AND n.name ILIKE '%sp%'
  AND it2.id IN ('28')
GROUP BY mi1.info,
         n.name;