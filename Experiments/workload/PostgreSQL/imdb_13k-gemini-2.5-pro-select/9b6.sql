
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
WHERE n.name ILIKE '%fr%'
  AND t.production_year BETWEEN 1925 AND 2015
  AND it2.id IN ('24')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'writer')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
  AND it1.id IN ('2',
                  '5',
                  '6')
  AND mi1.info IN ('70 mm 6-Track',
                    'Brazil:16',
                    'Canada:PA',
                    'Canada:R',
                    'Finland:(Banned)',
                    'Germany:o.Al.',
                    'Iceland:L',
                    'Ireland:12A',
                    'Ireland:PG',
                    'Italy:VM14',
                    'New Zealand:PG',
                    'Peru:18',
                    'Philippines:G',
                    'Philippines:R-13',
                    'Portugal:M/16',
                    'Singapore:PG13',
                    'South Korea:12',
                    'Spain:7')
GROUP BY mi1.info,
         n.name;