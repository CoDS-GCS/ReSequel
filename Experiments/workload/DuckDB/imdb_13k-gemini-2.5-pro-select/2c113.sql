
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
  AND t.title IN ('(#1.1068)',
                   '(#1.156)',
                   '(#1.180)',
                   '(#1.272)',
                   '(#1.404)',
                   '(#1.425)',
                   '(#1.538)',
                   '(#1.566)',
                   '(#1.657)',
                   '(#1.687)',
                   '(#1.726)',
                   '(#1.834)',
                   '(#2.21)',
                   '(#7.15)',
                   '1984 NFL Draft',
                   'A Star Is Born',
                   'And the Winner Is...',
                   'Blind Ambition',
                   'Cry Wolf',
                   'Dawn of the Dead',
                   'Downtown',
                   'Dream Lover',
                   'Escape Route',
                   'Fame',
                   'For Love or Money',
                   'General Hospital',
                   'Handle with Care',
                   'Lawa. Opowiesc o Dziadach Adama Mickiewicza',
                   'Loophole',
                   'Man of the Year',
                   'Night Shift',
                   'Opportunity Knocks',
                   'Queen City Rocker',
                   'Shadow of a Man',
                   'Snow Job',
                   'Solar Crisis',
                   'Stradivari',
                   'The Birthday Party',
                   'The Godfather',
                   'The House',
                   'The Operation',
                   'The Outing',
                   'The Seekers',
                   'The Torch',
                   'Time Bomb',
                   'Time Out',
                   'Zatôichi')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Panaflex Camera and Lenses by Panavision',
                    'LAB:DeLuxe',
                    'LAB:Fotofilm S.A., Madrid, Spain',
                    'LAB:Kinuta Laboratories, Tokyo, Japan',
                    'OFM:Video',
                    'PCS:(anamorphic)',
                    'PCS:Techniscope',
                    'RAT:1.33 : 1',
                    'RAT:2.35 : 1')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('104',
                    '72',
                    '73',
                    '80',
                    '93',
                    '95',
                    'France:90',
                    'USA:25',
                    'USA:30',
                    'West Germany:90')
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
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew'));