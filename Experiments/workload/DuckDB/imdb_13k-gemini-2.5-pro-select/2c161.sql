
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.126)',
                   '(#1.43)',
                   '(#2.16)',
                   '(#2.24)',
                   '(#2.36)',
                   '(#4.6)',
                   '(#5.13)',
                   '(#5.28)',
                   '(#6.14)',
                   'A Life of Her Own',
                   'A-Haunting We Will Go',
                   'Beatrice Cenci',
                   'Breakout',
                   'Carry on Cowboy',
                   'Devdas',
                   'Dixie',
                   'Föltámadott a tenger',
                   'Gentlemen Prefer Blondes',
                   'Holnap lesz fácán',
                   'Hurricane',
                   'Maytime',
                   'Mission to Moscow',
                   'Schneider Wibbel',
                   'Shichinin no samurai',
                   'The Actress',
                   'The Cats-Paw',
                   'The Challenge',
                   'The Execution',
                   'The Gold Rush',
                   'The Innocent',
                   'The Lost Weekend',
                   'The Masked Marvel',
                   'The Pit',
                   'The Ringer',
                   'The Swordsman',
                   'Thicker Than Water',
                   'This Is the Army',
                   'Wake Island',
                   'World of Sport')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IS NULL) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'composer',
                   'guest',
                   'miscellaneous crew',
                   'production designer')) AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('17')
  AND mi1.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby Digital',
                    'Mono',
                    'Stereo');