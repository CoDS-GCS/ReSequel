WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#2.2)',
                   '(#3.30)',
                   '(#3.4)',
                   '(#5.10)',
                   '(#5.9)',
                   'Charleys Tante',
                   'Conspiracy',
                   'Designing Woman',
                   'Eyewitness News',
                   'Killer McCoy',
                   'Land of Liberty',
                   'Monte Cristo',
                   'Roman Holiday',
                   'Salome',
                   'Scandal Sheet',
                   'Second Chance',
                   'The Big Gamble',
                   'The Girl Friend',
                   'The Honeymoon',
                   'The Locket',
                   'The Man Who Came Back',
                   'The Ordeal',
                   'The Secret',
                   'The Survivors',
                   'The Target',
                   'The Wild Bunch',
                   'World of Sport')
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
   WHERE ROLE IN ('actor',
                   'guest',
                   'miscellaneous crew',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('108',
                    '13',
                    '80',
                    '89',
                    '92')
  AND mi2.info IN ('Berlin, Germany',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Republic Studios, Hollywood, Los Angeles, California, USA');