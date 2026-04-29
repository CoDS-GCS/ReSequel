WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.53)',
                   '(#1.69)',
                   '(#1.9)',
                   '(#2.44)',
                   '(#3.29)',
                   '(#4.24)',
                   '(#6.4)',
                   '(#7.6)',
                   'A Time to Die',
                   'Boomerang',
                   'Collectors Item',
                   'Counter-Attack',
                   'Die Ratten',
                   'End of the Road',
                   'Game 6',
                   'Gunfight at the O.K. Corral',
                   'It Happened in Hollywood',
                   'It Started with Eve',
                   'Le fantôme de la liberté',
                   'Lost',
                   'Madame Bovary',
                   'Mrs. Wiggs of the Cabbage Patch',
                   'Part 1',
                   'Pinocchio',
                   'Rembrandt',
                   'Richard II Part 2: The Deposing of a King',
                   'Seven Sinners',
                   'Sherlock Holmes',
                   'Son of Sinbad',
                   'Stage Door',
                   'Stakeout',
                   'Sun Valley Serenade',
                   'Survival',
                   'The Accused',
                   'The Adventures of Huckleberry Finn',
                   'The Boss',
                   'The Crucible',
                   'The Grapes of Wrath',
                   'The Man Who Came Back',
                   'The Rebel',
                   'The Reckoning',
                   'The Secret',
                   'The Silent Witness',
                   'Tommy',
                   'Unusual Occupations',
                   'Wake Island',
                   'Watch the Birdie',
                   'Wells Fargo')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'director',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Canada',
                    'Czechoslovakia',
                    'Denmark',
                    'East Germany',
                    'France',
                    'India',
                    'Portugal',
                    'Romania',
                    'Soviet Union',
                    'Spain');