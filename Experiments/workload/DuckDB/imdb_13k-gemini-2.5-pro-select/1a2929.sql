
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('16')
  AND mi1.info IN ('Australia:1984',
                    'Australia:1985',
                    'USA:1983',
                    'USA:1985',
                    'USA:1986',
                    'USA:1987',
                    'USA:1988',
                    'USA:1989')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND n.gender IS NULL
  AND rt.role IN ('composer',
                   'costume designer',
                   'director',
                   'writer');