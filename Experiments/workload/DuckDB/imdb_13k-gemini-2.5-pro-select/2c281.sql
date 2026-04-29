WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.41)',
                   '(#1.81)',
                   '(#1.92)',
                   '(#2.27)',
                   '(#4.29)',
                   'A Matter of Honor',
                   'After the Thin Man',
                   'All the Kings Men',
                   'Dead Reckoning',
                   'Deadfall',
                   'Errand of Mercy',
                   'Mary of Scotland',
                   'Meet the People',
                   'Mildred Pierce',
                   'O Lucky Man!',
                   'One Good Turn',
                   'Rendezvous',
                   'The Bridge',
                   'The Dark Angel',
                   'The Enchanted',
                   'The Four Horsemen of the Apocalypse',
                   'The Gangster',
                   'The Imposter',
                   'The Naked City',
                   'The Outcasts of Poker Flat',
                   'The Stowaway',
                   'The Survivor',
                   'The Winslow Boy',
                   'Tora! Tora! Tora!')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'guest',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Argentina',
                    'Denmark',
                    'Egypt',
                    'France',
                    'Greece',
                    'Hungary',
                    'India',
                    'Italy',
                    'Japan',
                    'Netherlands',
                    'West Germany',
                    'Yugoslavia')
  AND mi2.info IN ('Black and White',
                    'Color');