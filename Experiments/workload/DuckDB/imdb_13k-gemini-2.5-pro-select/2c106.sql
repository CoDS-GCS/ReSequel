
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.15)',
                   '(#8.9)',
                   'Behind the Mask',
                   'Circumstantial Evidence',
                   'Dixie',
                   'Ein idealer Gatte',
                   'Everybody Does It',
                   'Florian',
                   'Guest in the House',
                   'King of the Mountain',
                   'Melodi grand prix',
                   'Monsieur Beaucaire',
                   'Mr. Skeffington',
                   'One Sunday Afternoon',
                   'Pursued',
                   'Stella',
                   'The Baby',
                   'The Betrayal',
                   'The Cat and the Fiddle',
                   'The General',
                   'The Hunters',
                   'The Impostor',
                   'The Kidnapping',
                   'The Man Who Broke the Bank at Monte Carlo',
                   'The Medicine Man',
                   'The Other Man',
                   'The Pursuit of Happiness',
                   'The Texas Rangers')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'production designer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Mono',
                    'Silent')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'London, England, UK',
                    'Mexico',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Rome, Lazio, Italy',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA');