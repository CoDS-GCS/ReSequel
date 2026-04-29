
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('6')
AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby',
                    'Stereo',
                    'Ultra Stereo')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('18')
AND mi2.info IN ('Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Rome, Lazio, Italy',
                    'San Francisco, California, USA',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('guest',
                   'miscellaneous crew',
                   'writer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f',
                    'm')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.195)',
                   '(#1.360)',
                   '(#1.368)',
                   '(#1.481)',
                   '(#1.539)',
                   '(#1.560)',
                   '(#3.10)',
                   'Alone in the T-Shirt Zone',
                   'Boomerang',
                   'Dead Ringers',
                   'Don Giovanni',
                   'Fall from Grace',
                   'Family Tree',
                   'Flash Point',
                   'Heroes',
                   'Im Gonna Git You Sucka',
                   'It Happened One Night',
                   'Love on the Run',
                   'Modern Love',
                   'Night Games',
                   'Parsifal',
                   'Safari',
                   'Selva de Pedra',
                   'The Cage',
                   'The Frame',
                   'The Skin Game',
                   'Theres No Place Like Home',
                   'Turning Point',
                   'Windfall');