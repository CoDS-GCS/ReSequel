
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
WHERE n.name ILIKE '%ha%'
  AND it2.id IN ('36')
  AND rt.role IN ('costume designer',
                   'director')
  AND t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('tv movie',
                   'video game',
                   'video movie')
  AND it1.id IN ('3',
                  '5')
  AND mi1.info IN ('Action',
                    'Australia:G',
                    'Finland:S',
                    'Iceland:12',
                    'Iceland:16',
                    'Netherlands:AL',
                    'News',
                    'Norway:15',
                    'Norway:16',
                    'Sweden:15',
                    'USA:Unrated',
                    'West Germany:12',
                    'West Germany:16')
GROUP BY mi1.info,
         n.name;