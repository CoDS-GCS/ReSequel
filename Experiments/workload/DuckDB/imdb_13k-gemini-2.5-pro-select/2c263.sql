
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.1)',
                   '(#1.101)',
                   '(#1.113)',
                   '(#1.95)',
                   '(#3.34)',
                   '(#5.29)',
                   '(#6.13)',
                   'Ambush',
                   'Borderline',
                   'Charleys Tante',
                   'Citizen Kane',
                   'Dick Tracy Returns',
                   'Die gefrorenen Blitze',
                   'Dirty Harry',
                   'Emergency',
                   'Gunfight at the O.K. Corral',
                   'Iron Man',
                   'Meet the People',
                   'My Fair Lady',
                   'O Lucky Man!',
                   'Rebellion',
                   'Rocambole',
                   'Sesame Street',
                   'The Big Noise',
                   'The Genius',
                   'The Letter',
                   'The Magic Box',
                   'The Show-Off',
                   'Vice Versa')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    'Dolby Digital',
                    'Mono',
                    'Silent')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:G',
                    'Finland:K-16',
                    'Iceland:16',
                    'Iceland:L',
                    'India:U',
                    'Spain:T',
                    'Sweden:15',
                    'USA:G',
                    'USA:TV-G',
                    'USA:Unrated',
                    'USA:X',
                    'West Germany:18')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'guest',
                   'producer'));