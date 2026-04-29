
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE n.name ILIKE '%ve%'
  AND it2.id IN ('29')
  AND rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:Unrated',
                    'Argentina:X',
                    'Austria:12',
                    'Canada:14+',
                    'Canada:XXX',
                    'China:(Banned)',
                    'Czech Republic:15',
                    'France:Unrated',
                    'Hungary:18',
                    'Japan:PG12',
                    'South Africa:16LV',
                    'Spain:16',
                    'Spain:X',
                    'Switzerland:6')
GROUP BY mi1.info,
         n.name;