
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#3.15)',
                   '(#3.35)',
                   '(#3.42)',
                   '(#7.2)',
                   'Artists and Models',
                   'Carrie',
                   'Checkmate',
                   'Du Barry Was a Lady',
                   'Familie Benthin',
                   'Giuseppe Verdi',
                   'La dolce vita',
                   'Lili',
                   'Mr. Deeds Goes to Town',
                   'Mr. Skeffington',
                   'Notorious',
                   'Reunion',
                   'Runaway',
                   'The Bohemian Girl',
                   'The Clock',
                   'The Gangs All Here',
                   'The Heiress',
                   'The Set-Up',
                   'With a Song in My Heart')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('6')
       AND mi1.info IN ('4-Track Stereo',
                    'Silent',
                    'Stereo'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('2')
       AND mi2.info IN ('Black and White',
                    'Color'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('cinematographer',
                   'composer')
       AND (n.gender IN ('m')
            OR n.gender IS NULL));