
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
WHERE n.name ILIKE '%ko%'
  AND t.production_year BETWEEN 1950 AND 1990
  AND it2.id IN ('23')
  AND rt.role IN ('composer',
                   'editor',
                   'production designer')
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('3',
                  '5')
  AND mi1.info IN ('Documentary',
                    'Iceland:16',
                    'Netherlands:16',
                    'Spain:13',
                    'Sport',
                    'UK:12',
                    'UK:18',
                    'UK:U',
                    'USA:G',
                    'USA:PG-13')
GROUP BY mi1.info,
         n.name;