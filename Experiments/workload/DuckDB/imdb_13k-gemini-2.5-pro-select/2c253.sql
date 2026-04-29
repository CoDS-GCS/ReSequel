
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#1.103)',
                   '(#1.29)',
                   '(#1.35)',
                   '(#1.71)',
                   '(#1.99)',
                   '(#2.31)',
                   '(#2.42)',
                   '(#4.16)',
                   '(#4.21)',
                   'Assassin',
                   'Beyond the Law',
                   'Cops and Robbers',
                   'Cry Uncle',
                   'Dallas',
                   'Das indische Grabmal',
                   'Dead Ringer',
                   'Delayed Action',
                   'Down to Earth',
                   'Game 1',
                   'Girl Crazy',
                   'Gone with the Wind',
                   'Jigsaw',
                   'Letter of the Law',
                   'Melodi grand prix',
                   'O Lucky Man!',
                   'Outcast',
                   'Rich Man, Poor Man',
                   'Small Town Girl',
                   'Survival',
                   'The Assassins',
                   'The Black Sheep',
                   'The Connection',
                   'The Eurovision Song Contest',
                   'The Foundling',
                   'The General',
                   'The Hospital',
                   'The Hostages',
                   'The Jazz Singer',
                   'The Killers',
                   'The Last of the Mohicans',
                   'The Man Outside',
                   'The Man Who Dared',
                   'The Man Who Knew Too Much',
                   'The Seventh Cross',
                   'Whirlpool',
                   'World of Sport',
                   'Wuthering Heights',
                   'You and Me')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('26',
                    '77',
                    '81',
                    '84',
                    '87',
                    '88',
                    '91',
                    '97',
                    '99',
                    'USA:7')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
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
                   'composer',
                   'costume designer',
                   'director'));