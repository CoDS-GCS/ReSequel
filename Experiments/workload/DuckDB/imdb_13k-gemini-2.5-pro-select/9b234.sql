
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
                   'tv movie')
  AND it1.id IN ('2',
                  '3',
                  '5')
  AND mi1.info IN ('Belgium:KT',
                    'Canada:14+',
                    'Canada:18+',
                    'Canada:A',
                    'Chile:TE',
                    'Denmark:15',
                    'Denmark:7',
                    'Finland:K-13',
                    'Finland:K-18',
                    'Iceland:14',
                    'India:A',
                    'Japan:R-15',
                    'Netherlands:18',
                    'New Zealand:PG',
                    'Norway:12',
                    'UK:A',
                    'USA:TV-G',
                    'USA:X')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND n.name ILIKE '%bea%'
  AND it2.id IN ('34')
GROUP BY mi1.info,
         n.name;