
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Mono',
                    'Stereo')
  AND it1.id IN ('6')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Madrid, Spain',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('18')
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.47)',
                   '(#1.52)',
                   '(#2.7)',
                   '(#4.1)',
                   '(#4.28)',
                   '(#6.24)',
                   '(#7.15)',
                   'A Star Is Born',
                   'Ace in the Hole',
                   'Adhikar',
                   'Annie Get Your Gun',
                   'Assignment in Brittany',
                   'Backfire',
                   'Betrayed',
                   'Black Sheep',
                   'Blackmail',
                   'Don Juan',
                   'False Witness',
                   'Familie Benthin',
                   'For Love or Money',
                   'Föltámadott a tenger',
                   'Golden Boy',
                   'High Tension',
                   'In Old Chicago',
                   'Just for You',
                   'Kitty',
                   'Ningen no jôken',
                   'O Lucky Man!',
                   'Othello',
                   'Pressure',
                   'Rebecca',
                   'So Big',
                   'Stormy Weather',
                   'The Best Man Wins',
                   'The Brothers',
                   'The Clown',
                   'The Golden Fleece',
                   'The Intruder',
                   'The Life of the Party',
                   'The Night Riders',
                   'The Oscar',
                   'The Sea Wolf',
                   'The Train',
                   'The Walls of Jericho',
                   'Two for the Money')
  AND kt.kind IN ('movie',
                   'video game')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('director',
                   'editor');