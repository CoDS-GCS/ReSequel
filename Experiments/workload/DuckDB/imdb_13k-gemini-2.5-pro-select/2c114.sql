
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_info AS mi2 ON t.id = mi2.movie_id
INNER JOIN info_type AS it2 ON mi2.info_type_id = it2.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.56)',
                   '(#1.70)',
                   '(#1.73)',
                   '(#3.15)',
                   '(#8.13)',
                   'All the Kings Men',
                   'Batman',
                   'Bedtime Story',
                   'Birds of a Feather',
                   'Branded',
                   'Dick Tracy',
                   'Inside Job',
                   'Les deux orphelines',
                   'Of Human Bondage',
                   'Rhapsody in Blue',
                   'Rózsa Sándor',
                   'Sanctuary',
                   'Scapegoat',
                   'Sisters',
                   'Stampede Wrestling',
                   'Thats the Spirit',
                   'The Avengers',
                   'The Big Gamble',
                   'The Payoff',
                   'The Wild Party',
                   'Two Tickets to Broadway',
                   'Two of a Kind',
                   'Welcome Home')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND it1.id IN ('3')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Crime',
                    'Drama',
                    'Fantasy',
                    'Film-Noir',
                    'Sci-Fi',
                    'Short',
                    'Western')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'director')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);