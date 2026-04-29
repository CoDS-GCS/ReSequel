WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.131)',
                   '(#1.202)',
                   '(#1.334)',
                   '(#1.340)',
                   '(#1.454)',
                   '(#1.61)',
                   '(#1.676)',
                   '(#2.27)',
                   '(#3.2)',
                   '(#3.24)',
                   '(#5.27)',
                   '(#9.1)',
                   '(#9.18)',
                   '1985 NFL Draft',
                   'Akô rôshi - Ten no maki; Chi no maki',
                   'Das Boot',
                   'Der Name der Rose',
                   'Entertainment Tonight',
                   'La Bohème',
                   'Mga kwento ni Lola Basyang',
                   'One Night Stand',
                   'Paradise Alley',
                   'Part 2',
                   'Rage',
                   'Rude Awakening',
                   'Scarface',
                   'Scavenger Hunt',
                   'Secrets',
                   'Shock Treatment',
                   'Sonny Boy',
                   'The Innocent',
                   'The Mugger',
                   'The Other Man',
                   'The Outsiders',
                   'The Whole Truth',
                   'Tightrope')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Comedy',
                    'Family',
                    'Fantasy',
                    'Horror',
                    'Mystery',
                    'Sci-Fi',
                    'Western')
  AND mi2.info IN ('4-Track Stereo',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo');