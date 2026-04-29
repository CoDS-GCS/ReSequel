
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
WHERE n.name ILIKE '%malc%'
  AND it2.id IN ('19')
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
  AND t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('3',
                  '4',
                  '6')
  AND mi1.info IN ('English')
GROUP BY mi1.info,
         n.name;