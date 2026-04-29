WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.79)',
                   '(#2.33)',
                   '(#3.27)',
                   '(#3.7)',
                   '(#4.17)',
                   '(#4.26)',
                   '(#5.21)',
                   '(#6.14)',
                   'A Tale of Two Cities',
                   'Adventure',
                   'Aida',
                   'Angel',
                   'Blind Mans Bluff',
                   'Casablanca',
                   'Earthquake',
                   'Easy Come, Easy Go',
                   'Fall Guy',
                   'Fantômas',
                   'Flying Down to Rio',
                   'Golden Girl',
                   'Huckleberry Finn',
                   'Like Father, Like Son',
                   'Line of Fire',
                   'Maria',
                   'Marry Me',
                   'Miyamoto Musashi',
                   'Othello',
                   'Pack Up Your Troubles',
                   'Rich Man, Poor Man',
                   'Rip Van Winkle',
                   'Shadows',
                   'Sherlock Holmes',
                   'The Actress',
                   'The Connection',
                   'The Executioners',
                   'The Fanatics',
                   'The French Line',
                   'The Gypsies',
                   'The Politician',
                   'The Red Shoes',
                   'The Tiger',
                   'They Drive by Night',
                   'Two of a Kind',
                   'Woman to Woman')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'miscellaneous crew',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Chronophone',
                    'Cinephone',
                    'De Forest Phonofilm',
                    'Dolby Digital',
                    'Mono',
                    'Perspecta Stereo',
                    'Silent',
                    'Stereo',
                    'Vitaphone')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'MET:',
                    'MET:600 m',
                    'PCS:Kinescope',
                    'PCS:Techniscope',
                    'RAT:1.20 : 1');