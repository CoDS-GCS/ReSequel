
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
WHERE n.name ILIKE '%ke%'
  AND it2.id IN ('33')
  AND rt.role IN ('costume designer',
                   'director',
                   'producer')
  AND t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('2',
                  '5',
                  '8')
  AND mi1.info IN ('Argentina',
                    'Argentina:M',
                    'Brazil:14',
                    'Canada:16+',
                    'Canada:18A',
                    'Czechoslovakia',
                    'Estonia',
                    'Finland:K-3',
                    'Greece:K',
                    'Greece:K-13',
                    'Hungary:18',
                    'Ireland:12',
                    'Italy:VM18',
                    'Malaysia:U',
                    'Norway:18',
                    'Philippines',
                    'Singapore:PG13',
                    'Sweden:11',
                    'USA:K-A')
GROUP BY mi1.info,
         n.name;