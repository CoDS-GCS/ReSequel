
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
WHERE n.name ILIKE '%myr%'
  AND t.production_year BETWEEN 1925 AND 2015
  AND it2.id IN ('25')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'production designer')
  AND kt.kind IN ('movie',
                   'tv movie')
  AND it1.id IN ('3',
                  '5')
  AND mi1.info IN ('Argentina:16',
                    'Canada:G',
                    'Chile:14',
                    'Finland:K-12',
                    'Germany:16',
                    'Germany:6',
                    'Netherlands:16',
                    'South Korea:15',
                    'Switzerland:12',
                    'UK:A',
                    'USA:TV-G')
GROUP BY mi1.info,
         n.name;