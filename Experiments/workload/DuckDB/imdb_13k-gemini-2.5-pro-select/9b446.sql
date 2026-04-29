
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
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:13',
                    'Canada:PG',
                    'Finland:K-16',
                    'Netherlands:AL',
                    'Norway:15',
                    'Singapore:PG',
                    'UK:12',
                    'UK:U',
                    'USA:PG-13',
                    'USA:R',
                    'USA:TV-G',
                    'USA:TV-Y',
                    'West Germany:16',
                    'West Germany:o.Al.')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND n.name ILIKE '%tr%'
  AND it2.id IN ('26')
GROUP BY mi1.info,
         n.name;