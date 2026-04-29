
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
  AND t.title IN ('(#1.40)',
                   '(#1.69)',
                   '(#1.82)',
                   '(#2.28)',
                   '(#4.18)',
                   '(#5.1)',
                   'A Day at the Races',
                   'Carmen',
                   'Command Decision',
                   'Der kaukasische Kreidekreis',
                   'Face to Face',
                   'Julie',
                   'Keep Smiling',
                   'Magnum Force',
                   'Off Limits',
                   'Paris brûle-t-il?',
                   'Puppy Love',
                   'Quarantine',
                   'Resurrection',
                   'Revenge',
                   'The Burglar',
                   'The Country Doctor',
                   'The Facts of Life',
                   'The Hound of the Baskervilles',
                   'The Scapegoat',
                   'The Set-Up',
                   'The Shakiest Gun in the West',
                   'Tower of London',
                   'Vanity Fair',
                   'Wells Fargo',
                   'Wo Du hin gehst...',
                   'You Cant Escape Forever',
                   'Zweiter Teil')
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Czech',
                    'Danish',
                    'Dutch',
                    'English',
                    'Georgian',
                    'German',
                    'Hungarian',
                    'Mandarin',
                    'None',
                    'Norwegian',
                    'Persian',
                    'Polish',
                    'Portuguese',
                    'Serbo-Croatian',
                    'Swedish')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('101',
                    '104',
                    '15',
                    '25',
                    '50',
                    '68',
                    '72',
                    '74',
                    '77',
                    '8',
                    '84',
                    '88',
                    'USA:10')
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
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'miscellaneous crew',
                   'production designer'));