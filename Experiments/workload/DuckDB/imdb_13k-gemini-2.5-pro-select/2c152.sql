
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
WHERE mi1.info IN ('East Germany',
                    'France',
                    'India',
                    'Iran',
                    'Japan',
                    'Netherlands',
                    'Portugal',
                    'Romania',
                    'Soviet Union',
                    'Spain',
                    'Taiwan',
                    'UK',
                    'USA',
                    'West Germany')
  AND it1.id IN ('8')
  AND mi2.info IN ('Arabic',
                    'Bengali',
                    'Cantonese',
                    'Danish',
                    'German',
                    'Greek',
                    'Hindi',
                    'Hungarian',
                    'Malayalam',
                    'Mandarin',
                    'Polish',
                    'Spanish',
                    'Tamil',
                    'Turkish')
  AND it2.id IN ('4')
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#2.48)',
                   'Anchors Aweigh',
                   'Bad Boy',
                   'Der müde Theodor',
                   'Destry Rides Again',
                   'Geronimo',
                   'Hello, Dolly!',
                   'Huckleberry Finn',
                   'Maya Bazaar',
                   'Million Dollar Baby',
                   'Nob Hill',
                   'Only Yesterday',
                   'Out of the Blue',
                   'Pinocchio',
                   'Seven Sinners',
                   'Sister Kenny',
                   'Stranded',
                   'The Awful Truth',
                   'The Clown',
                   'The Picnic',
                   'The Return',
                   'The Silent Witness',
                   'The Substitute',
                   'The Visitor')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actress',
                   'composer');