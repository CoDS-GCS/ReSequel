WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.100)',
                   '(#1.144)',
                   '(#1.47)',
                   '(#1.735)',
                   '(#2.59)',
                   '(#6.16)',
                   '(1988-12-17)',
                   'Appearances',
                   'Brutal Glory',
                   'Catherine',
                   'Emily',
                   'Empire of the Sun',
                   'Hear No Evil',
                   'Inside Out',
                   'Les Miserables',
                   'Linda',
                   'Night Patrol',
                   'Pot-Bouille',
                   'Rain Man',
                   'Reach for the Sky',
                   'Summer Holiday',
                   'The 62nd Annual Academy Awards',
                   'The Birthday Party',
                   'The Border',
                   'The Passing',
                   'The Professor',
                   'Trial by Fury',
                   'Under Pressure',
                   'Why Me?')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('producer',
                   'production designer')
  AND it1.id IN ('8')
  AND mi1.info IN ('Belgium',
                    'Brazil',
                    'Bulgaria',
                    'China',
                    'Georgia',
                    'Germany',
                    'Indonesia',
                    'Pakistan',
                    'Philippines',
                    'Poland',
                    'South Africa',
                    'Spain',
                    'Taiwan')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');