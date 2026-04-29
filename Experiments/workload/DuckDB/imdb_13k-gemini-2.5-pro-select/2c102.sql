WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.162)',
                   '(#1.633)',
                   '(#1.838)',
                   '(#1.954)',
                   '(#10.11)',
                   '(#9.3)',
                   'Alone in the T-Shirt Zone',
                   'Ciske de Rat',
                   'Crossing Delancey',
                   'Fly Away Home',
                   'I Spy',
                   'Iceman',
                   'Illegally Yours',
                   'Into the Night',
                   'Laura',
                   'Little Boy Blue',
                   'Paris brûle-t-il?',
                   'Shadow of a Doubt',
                   'The Browning Version',
                   'The Fourth Reich',
                   'The Outsider')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'editor',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'San Francisco, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA');