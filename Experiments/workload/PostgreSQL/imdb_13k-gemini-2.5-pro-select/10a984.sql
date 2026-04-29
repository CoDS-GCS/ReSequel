
SELECT n.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('English')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('2',
                  '4',
                  '6')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
JOIN name AS n ON ci.person_id = n.id
AND n.name ILIKE '%macpher%'
GROUP BY n.name,
         mi1.info;