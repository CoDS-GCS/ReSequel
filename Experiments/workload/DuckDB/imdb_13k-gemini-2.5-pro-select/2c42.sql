WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.57)',
                   '(#1.89)',
                   '(#1.95)',
                   '(#2.19)',
                   '(#3.33)',
                   '(#5.1)',
                   '(#5.13)',
                   '(#6.2)',
                   'Adhikar',
                   'Candida',
                   'Caught in the Act',
                   'Cinderella',
                   'Die Toten bleiben jung',
                   'Ill Fix It',
                   'Just My Luck',
                   'Keep Smiling',
                   'King Kong',
                   'Montserrat',
                   'My Wild Irish Rose',
                   'Playgirl',
                   'Sesame Street',
                   'Shadow of a Man',
                   'The Big Noise',
                   'The Big Parade of Comedy',
                   'The Circus',
                   'The Dinner Party',
                   'The Old Curiosity Shop',
                   'The Paleface',
                   'The Public Menace',
                   'The Shadow',
                   'The Sniper',
                   'The White Angel',
                   'The Witch')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
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
                   'costume designer',
                   'guest',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Corriganville, Ray Corrigan Ranch, Simi Valley, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Philippines',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Stage 17, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND mi2.info IN ('Australia',
                    'Canada',
                    'Czechoslovakia',
                    'Finland',
                    'India',
                    'Japan',
                    'Mexico',
                    'Philippines',
                    'Poland',
                    'Portugal',
                    'Soviet Union',
                    'Spain',
                    'Sweden',
                    'UK',
                    'West Germany');