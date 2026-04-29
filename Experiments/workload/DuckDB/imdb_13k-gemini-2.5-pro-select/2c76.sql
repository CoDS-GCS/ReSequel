
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.118)',
                   '(#3.28)',
                   '(#5.27)',
                   'A Dispatch from Reuters',
                   'Brigadoon',
                   'Catspaw',
                   'Ein idealer Gatte',
                   'Hangmen Also Die!',
                   'High Finance',
                   'Holnap lesz fácán',
                   'Its a Great Life',
                   'Kim',
                   'Kismet',
                   'Love Letters',
                   'Maya Bazaar',
                   'Mihai Viteazul',
                   'National Velvet',
                   'Navy Wife',
                   'Paula',
                   'Saturdays Hero',
                   'Teresa',
                   'The Gunman',
                   'The Magician',
                   'The Mark of Cain',
                   'The Witness',
                   'This Is the Army')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('1')
       AND mi1.info IN ('101',
                    '15',
                    '17',
                    '3',
                    '50',
                    '6',
                    '83',
                    'USA:18',
                    'USA:30'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('6')
       AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('director',
                   'production designer')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));