
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('Black and White',
                    'Color')
  AND it1.id IN ('2')
  AND mi2.info IN ('Bengali',
                    'Cantonese',
                    'Filipino',
                    'Korean',
                    'Serbo-Croatian',
                    'Spanish')
  AND it2.id IN ('4')
  AND t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.12)',
                   '(#1.94)',
                   '(#2.23)',
                   '(#3.13)',
                   '(#3.30)',
                   '(#4.3)',
                   '(#5.1)',
                   'A Farewell to Arms',
                   'Beatrice Cenci',
                   'Buried Treasure',
                   'Camille',
                   'County Fair',
                   'Death Watch',
                   'Der Feldherrnhügel',
                   'Detective Story',
                   'Down on the Farm',
                   'Election 70',
                   'Fair Exchange',
                   'Follow the Sun',
                   'Hunt the Man Down',
                   'La casa de la Troya',
                   'Leuchtfeuer',
                   'Love',
                   'Mandrin',
                   'Million Dollar Mermaid',
                   'On the Run',
                   'Only Yesterday',
                   'Part 1',
                   'Showdown',
                   'Spartacus',
                   'Street Scene',
                   'Temptation',
                   'The Appointment',
                   'The Buccaneer',
                   'The Contest',
                   'The Cure',
                   'The Debt',
                   'The Fixer',
                   'The Gamblers',
                   'The Great Adventures of Wild Bill Hickok',
                   'The Great Impersonation',
                   'The Hunters',
                   'The Informer',
                   'The Innocent',
                   'The Legacy',
                   'Togetherness',
                   'Up the Junction',
                   'With a Song in My Heart',
                   'You and Me')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor');