WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.159)',
                   '(#1.190)',
                   '(#1.198)',
                   '(#1.273)',
                   '(#1.341)',
                   '(#1.500)',
                   '(#1.528)',
                   '(#1.588)',
                   '(#1.742)',
                   '(#1.847)',
                   '(#1.853)',
                   '(#11.8)',
                   'Code of Silence',
                   'Danny',
                   'Dansk melodi grand prix',
                   'Days of Thunder',
                   'Divide and Conquer',
                   'Don Giovanni',
                   'Escolinha do Professor Raimundo',
                   'Fear of Flying',
                   'Fünfte Folge',
                   'Gabriela',
                   'Gas',
                   'Hansel and Gretel',
                   'In Love and War',
                   'Nana',
                   'Parlez-nous damour',
                   'Peter Pan',
                   'Power',
                   'Raw Deal',
                   'Singin in the Rain',
                   'Star Trek: The Motion Picture',
                   'Such Good Friends',
                   'Superman',
                   'The Abyss',
                   'The Big Fight',
                   'The Courier',
                   'The Outing',
                   'The Razors Edge',
                   'The Silver Chalice',
                   'Urgh! A Music War',
                   'World Wide Wrestling')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('France',
                    'Poland',
                    'Sweden',
                    'Switzerland',
                    'West Germany')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent');