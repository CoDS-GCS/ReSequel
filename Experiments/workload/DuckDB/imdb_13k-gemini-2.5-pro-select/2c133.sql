WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.16)',
                   '(#7.7)',
                   'A Place in the Sun',
                   'Birds of a Feather',
                   'Blue Skies',
                   'Der Feldherrnhügel',
                   'Der Maulkorb',
                   'Guest in the House',
                   'Gypsy',
                   'Is There Sex After Death?',
                   'Justice',
                   'Mandrin',
                   'Melodi grand prix',
                   'One Sunday Afternoon',
                   'Prima puntata',
                   'Pygmalion',
                   'Roberta',
                   'Ruggles of Red Gap',
                   'Sailor Beware',
                   'Salome',
                   'Section spéciale',
                   'Somebody Up There Likes Me',
                   'The Charge of the Light Brigade',
                   'The Patriot',
                   'The Phantom of the Opera',
                   'The Tell-Tale Heart',
                   'Threes Company',
                   'Tora! Tora! Tora!')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
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
                   'director',
                   'editor',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('17')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'Dolby Digital',
                    'Mono',
                    'Silent',
                    'Stereo');