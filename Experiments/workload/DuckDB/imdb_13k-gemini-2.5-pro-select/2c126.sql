
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.83)',
                   '(#2.8)',
                   '(#8.1)',
                   'A Dispatch from Reuters',
                   'A Piece of the Action',
                   'Captain America',
                   'Cleopatra',
                   'Die große Chance',
                   'Janie',
                   'Mr. Deeds Goes to Town',
                   'Mr. Smith Goes to Washington',
                   'Out of the Past',
                   'SOS Coast Guard',
                   'Show Me the Way to Go Home',
                   'Slightly Dangerous',
                   'The Gift',
                   'The Godfather: Part II',
                   'The Miracle of the Bells',
                   'The Perils of Pauline',
                   'The Rebel',
                   'The Spiders Web',
                   'The Ugly Duckling',
                   'This Is the Army',
                   'Week-End at the Waldorf',
                   'Woman to Woman')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video movie'))
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Arabic',
                    'English',
                    'German',
                    'Italian',
                    'Japanese',
                    'Latin',
                    'Mandarin',
                    'Spanish')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Argentina:Atp',
                    'Australia:M',
                    'Australia:PG',
                    'Finland:(Banned)',
                    'Finland:K-16',
                    'Finland:K-18',
                    'Iceland:16',
                    'Iceland:L',
                    'Netherlands:18',
                    'Netherlands:AL',
                    'UK:15',
                    'USA:R',
                    'West Germany:12',
                    'West Germany:16')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);