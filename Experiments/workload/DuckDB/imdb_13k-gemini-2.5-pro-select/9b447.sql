
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
AND it2.id IN ('33')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'editor',
                   'production designer',
                   'writer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1875 AND 1975
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
AND mi1.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Canada:PG',
                    'Mexico',
                    'Philippines',
                    'UK',
                    'USA:Not Rated',
                    'War',
                    'West Germany',
                    'West Germany:12',
                    'West Germany:16')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3',
                  '5',
                  '8')
WHERE n.name ILIKE '%par%'
GROUP BY mi1.info,
         n.name;