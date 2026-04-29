
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND t.title IN ('(#1.195)',
                   '(#1.33)',
                   '(#1.480)',
                   '(#1.579)',
                   '(#1.683)',
                   '(#4.24)',
                   'A Fine Romance',
                   'Below the Belt',
                   'Comic Relief',
                   'Days of Thunder',
                   'Dead of Night',
                   'Executive Action',
                   'Ginger e Fred',
                   'Good News, Bad News',
                   'I promessi sposi',
                   'Illusions',
                   'La porteuse de pain',
                   'Labyrinth',
                   'Licensed to Kill',
                   'Love Hurts',
                   'Meet Me in Las Vegas',
                   'Moonlighting',
                   'Most',
                   'On a volé Charlie Spencer!',
                   'Part 9',
                   'Scared Stiff',
                   'Street Smart',
                   'Thanksgiving',
                   'Thats Dancing!',
                   'The Arena',
                   'The Last Emperor',
                   'The Outing',
                   'The Rival',
                   'The Toxic Avenger Part II',
                   'Wedding',
                   'Zombie Brigade')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('France:-12',
                    'Germany:12',
                    'Iceland:L',
                    'Netherlands:16',
                    'Sweden:Btl',
                    'USA:Approved')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'miscellaneous crew',
                   'producer',
                   'writer'));