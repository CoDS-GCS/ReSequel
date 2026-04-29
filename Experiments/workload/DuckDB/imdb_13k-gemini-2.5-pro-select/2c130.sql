WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.513)',
                   '(#1.553)',
                   '(#1.650)',
                   '(#1.678)',
                   '(#1.812)',
                   'Baby',
                   'Battle of Britain',
                   'Cincinnati Bengals vs. Miami Dolphins',
                   'Das Vermächtnis',
                   'Day One',
                   'Diamonds Are Forever',
                   'Disco Godfather',
                   'Entente Cordiale',
                   'Foul Play',
                   'G.I. Joe: The Movie',
                   'Honor Thy Father',
                   'Hostages',
                   'Less Than Zero',
                   'Lethal Weapon',
                   'Los Angeles Raiders vs. San Diego Chargers',
                   'Loving',
                   'Modern Love',
                   'Out of Control',
                   'Ransom',
                   'Rescue',
                   'Roadie',
                   'Secret Admirer',
                   'Special',
                   'The Affair',
                   'The Buccaneer',
                   'The City',
                   'The Judge',
                   'The Monster',
                   'The Oath',
                   'The Red Shoes',
                   'The Unholy',
                   'The Warriors',
                   'Tune in Tomorrow...')
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
   WHERE ROLE IN ('miscellaneous crew',
                   'producer'))
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
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'Mexico',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'San Francisco, California, USA',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA');