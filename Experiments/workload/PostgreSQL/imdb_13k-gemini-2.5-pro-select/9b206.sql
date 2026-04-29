
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
AND it2.id IN ('33')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
AND mi1.info IN ('Argentina:13',
                    'Australia:MA',
                    'Brazil:14',
                    'Italy:VM14',
                    'Netherlands:12',
                    'Norway:11',
                    'South Korea:18',
                    'UK:PG',
                    'UK:U',
                    'USA:R',
                    'West Germany:16',
                    'West Germany:6')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('5')
WHERE n.name ILIKE '%po%'
GROUP BY mi1.info,
         n.name;