WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.108)',
                   '(#1.37)',
                   '(#1.62)',
                   '(#2.2)',
                   '(#2.24)',
                   '(#2.9)',
                   '(#3.12)',
                   '(#3.29)',
                   '(#3.9)',
                   '(#5.4)',
                   '(#6.1)',
                   '(#6.4)',
                   'Back Street',
                   'Blue Skies',
                   'Custers Last Stand',
                   'Der Hexer',
                   'Die Brücke',
                   'End of the Road',
                   'I Take This Woman',
                   'Its a Wonderful World',
                   'Jennifer',
                   'Krach im Hinterhaus',
                   'Part 4',
                   'Ransom',
                   'Reckless',
                   'Scandal',
                   'Tales of Manhattan',
                   'The Amazing Exploits of the Clutching Hand',
                   'The Exchange',
                   'The Great Train Robbery',
                   'The Greatest Show on Earth',
                   'The Gunfighter',
                   'The Happiest Days of Your Life',
                   'The Hiding Place',
                   'The Shadow',
                   'The War of the Worlds',
                   'Untamed',
                   'Up Front')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
                   'composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('MET:100 m',
                    'MET:130 m',
                    'MET:15.2 m',
                    'PCS:Spherical',
                    'PCS:Techniscope')
  AND mi2.info IN ('Hungary',
                    'India',
                    'Soviet Union',
                    'Turkey',
                    'West Germany',
                    'Yugoslavia');