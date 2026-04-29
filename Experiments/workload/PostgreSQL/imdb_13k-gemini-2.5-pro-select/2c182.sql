
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#1.5674)',
                   '(#1.73)',
                   '(1999-06-14)',
                   'A Capitol Fourth',
                   'Brutal Massacre: A Comedy',
                   'Carlos',
                   'Day of the Dead',
                   'Mansion of Blood',
                   'My Two Dads',
                   'Petit déjeuner compris',
                   'Solitudes',
                   'Spring Fever',
                   'Spurlos verschwunden',
                   'The Adventures of Pluto Nash',
                   'The Black Sheep',
                   'The Show-Off',
                   'The Talent Show',
                   'The Tracker',
                   'Witchcraft',
                   'Yesterdays Tomorrow')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('6-Track Stereo',
                    'AGA Sound System',
                    'DTS',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Perspecta Stereo',
                    'Silent',
                    'Ultra Stereo',
                    'Vitaphone')
  AND mi2.info_type_id IN ('7')
  AND mi2.info IN ('CAM:Red One Camera',
                    'PCS:CinemaScope',
                    'PCS:DV',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.85 : 1')
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
     WHERE ROLE IN ('actor',
                   'miscellaneous crew'));