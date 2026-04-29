WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.37)',
                   'A Time to Die',
                   'Birds of a Feather',
                   'Blossoms in the Dust',
                   'Das Lied der Matrosen',
                   'El amor tiene cara de mujer',
                   'Help Wanted',
                   'Huckleberry Finn',
                   'National Velvet',
                   'Open House',
                   'Pack Up Your Troubles',
                   'Quarantine',
                   'Scene of the Crime',
                   'Show Boat',
                   'The Avengers',
                   'The Black Widow',
                   'The Epidemic',
                   'The Hypnotist',
                   'The Masked Marvel',
                   'The Prisoner',
                   'The Virginian',
                   'Three Kids and a Queen')
     AND kt.kind IN ('movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('composer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND it2.id IN ('18')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA');