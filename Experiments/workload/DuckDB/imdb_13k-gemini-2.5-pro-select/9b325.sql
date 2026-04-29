
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
WHERE n.name ILIKE '%br%'
  AND t.production_year BETWEEN 1975 AND 2015
  AND it2.id IN ('24')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'writer')
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('5')
  AND mi1.info IN ('Brazil:16',
                    'Canada:14',
                    'Canada:AA',
                    'Finland:K-12',
                    'Finland:K-13',
                    'France:U',
                    'Germany:18',
                    'Ireland:12',
                    'Netherlands:MG6',
                    'New Zealand:G',
                    'New Zealand:M',
                    'New Zealand:PG',
                    'New Zealand:R16',
                    'New Zealand:R18',
                    'Singapore:PG13',
                    'South Korea:All',
                    'Sweden:15')
GROUP BY mi1.info,
         n.name;