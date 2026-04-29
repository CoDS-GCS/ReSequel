
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.103)',
                   '(#1.6)',
                   '(#7.5)',
                   'A Star Is Born',
                   'Arsenic and Old Lace',
                   'Batman',
                   'Dansk melodi grand prix',
                   'Der Feldherrnhügel',
                   'Ein idealer Gatte',
                   'End of the Road',
                   'Monty Python and the Holy Grail',
                   'Noblesse Oblige',
                   'Saturday Night',
                   'Shine on Harvest Moon',
                   'Stakeout',
                   'The Conspirators',
                   'The Unknown',
                   'Wells Fargo')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('17')
       AND mi1.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.',
                    'Original French title is undetermined.'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('6')
       AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'Dolby Digital',
                    'Mono',
                    'Silent'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('cinematographer',
                   'costume designer',
                   'guest')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));