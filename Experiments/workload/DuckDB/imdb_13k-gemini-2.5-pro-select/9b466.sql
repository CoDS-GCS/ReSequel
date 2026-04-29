
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
                   'tv series',
                   'video game')
  AND it1.id IN ('3',
                  '6',
                  '8')
  AND mi1.info IN ('Australia',
                    'Dolby Digital',
                    'East Germany',
                    'Fantasy',
                    'Game-Show',
                    'Norway',
                    'Sci-Fi',
                    'Spain',
                    'Switzerland',
                    'Thriller',
                    'War',
                    'Western')
  AND rt.role IN ('composer',
                   'editor',
                   'production designer')
  AND n.name ILIKE '%je%'
  AND it2.id IN ('19')
GROUP BY mi1.info,
         n.name;