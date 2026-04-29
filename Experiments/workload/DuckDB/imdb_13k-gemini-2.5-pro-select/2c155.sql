WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.22)',
                   '(#5.26)',
                   '(#6.19)',
                   'Airport 1975',
                   'Carnival',
                   'Devils Island',
                   'For Better, for Worse',
                   'Gold',
                   'Golden Girl',
                   'Guest in the House',
                   'Its in the Air',
                   'Madame Bovary',
                   'Many Happy Returns',
                   'Margie',
                   'Never Again',
                   'Nightmare',
                   'Our Relations',
                   'Out of the Night',
                   'Part 3',
                   'Reap the Wild Wind',
                   'Sanctuary',
                   'Shakedown',
                   'Shoot to Kill',
                   'Stormy Weather',
                   'The Alibi',
                   'The Cardinal',
                   'The Gunfighter',
                   'The Hunted',
                   'The Killers',
                   'The Long Goodbye',
                   'The Plunderers',
                   'The Prize',
                   'The Raiders',
                   'The Return',
                   'The Secret Storm',
                   'The Silent Witness',
                   'The Spoilers',
                   'Unterwegs zu Lenin',
                   'World Wide Wrestling')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
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
   WHERE ROLE IN ('costume designer',
                   'guest',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('Drama',
                    'Fantasy',
                    'Horror',
                    'Music',
                    'Short')
  AND mi2.info IN ('Argentina:13',
                    'Finland:K-18',
                    'Germany:12',
                    'Iceland:16',
                    'Portugal:M/12',
                    'Spain:13',
                    'UK:A',
                    'USA:TV-PG',
                    'USA:Unrated',
                    'USA:X',
                    'West Germany:6');