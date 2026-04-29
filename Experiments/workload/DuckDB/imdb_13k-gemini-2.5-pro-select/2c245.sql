
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.739)',
                   '(#1.812)',
                   '(#9.13)',
                   '(#9.7)',
                   'Babes in Toyland',
                   'Designing Woman',
                   'Genesis',
                   'The House on Carroll Street',
                   'The Puppetoon Movie',
                   'With a Song in My Heart')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'director',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('5')
  AND it2.id IN ('3')
  AND mi1.info IN ('Argentina:Unrated',
                    'Finland:K-15',
                    'France:X',
                    'Germany:12',
                    'India:U',
                    'New Zealand:R16',
                    'Portugal:M/6',
                    'Sweden:15',
                    'USA:Passed',
                    'USA:R',
                    'USA:TV-PG')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Animation',
                    'Comedy',
                    'Family',
                    'Film-Noir',
                    'History',
                    'Music',
                    'Musical',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Thriller',
                    'War',
                    'Western');