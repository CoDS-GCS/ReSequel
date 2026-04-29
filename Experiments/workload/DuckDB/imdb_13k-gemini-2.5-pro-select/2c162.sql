
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.48)',
                   '(#1.63)',
                   'A Family Affair',
                   'Bobby',
                   'Experiment Perilous',
                   'Holiday',
                   'Linda',
                   'Lover Come Back',
                   'Mighty Joe Young',
                   'Olympia 1. Teil - Fest der Völker',
                   'Overland Mail',
                   'Part 6',
                   'Royal Cavalcade',
                   'Summer Holiday',
                   'The FBI Story',
                   'The Farmer Takes a Wife',
                   'The Man Who Broke the Bank at Monte Carlo',
                   'The Masterpiece',
                   'The Three Musketeers')
     AND kt.kind IN ('movie',
                   'video movie')) AS t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'editor')
  AND it1.id IN ('3')
  AND mi1.info IN ('Adult',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Game-Show',
                    'Mystery',
                    'News',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Sport',
                    'War',
                    'Western')
  AND it2.id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Silent',
                    'Stereo');