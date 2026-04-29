WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.236)',
                   '(#1.523)',
                   '(#1.527)',
                   '(#1.606)',
                   '(#7.30)',
                   '(#8.19)',
                   'An Enemy of the People',
                   'Code of Silence',
                   'Doctor Ducks Super Secret All-Purpose Sauce',
                   'Dritter Teil',
                   'First Blood',
                   'Ghost in the Machine',
                   'Heimlichkeiten',
                   'I Do, I Do',
                   'I Spy',
                   'La provinciale',
                   'Look Whos Talking',
                   'Native Son',
                   'New York Giants vs. Philadelphia Eagles',
                   'Out to Lunch',
                   'Teil 1',
                   'The Young and the Restless',
                   'Touch of Death')
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
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'producer',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Hollywood, Los Angeles, California, USA',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'San Francisco, California, USA',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 20, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 25, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 27A, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 30, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Studio 8H, NBC Studios - 30 Rockefeller Plaza, Manhattan, New York City, New York, USA')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo');