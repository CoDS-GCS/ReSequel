
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
  AND t.title IN ('(#2.13)',
                   '(#3.22)',
                   '(#4.21)',
                   '(#8.2)',
                   'Anniversary',
                   'Black Jack',
                   'Casanova Brown',
                   'Clive of India',
                   'Conspiracy of Silence',
                   'Ebb Tide',
                   'Election 74',
                   'Game 4',
                   'Gilda',
                   'Happy Landing',
                   'Impasse',
                   'Its a Dogs Life',
                   'Jeanne Eagels',
                   'Jenny',
                   'Monsieur Beaucaire',
                   'No Place to Hide',
                   'Playmates',
                   'Stage Door',
                   'The Big Night',
                   'The Gold Rush',
                   'The Morning After',
                   'The Phantom Rider',
                   'The Pigeon',
                   'Ziemia obiecana')
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('102',
                    '106',
                    '107',
                    '13',
                    '57',
                    '58',
                    '62',
                    '64',
                    '71',
                    '75',
                    '78',
                    '84',
                    '91')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Czech',
                    'Danish',
                    'Dutch',
                    'English',
                    'Finnish',
                    'Hungarian',
                    'Mandarin',
                    'Polish',
                    'Russian',
                    'Serbo-Croatian',
                    'Swedish',
                    'Turkish')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew'));