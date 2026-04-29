
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND t.title IN ('(#1.1174)',
                   '(#1.5356)',
                   '(#1.6051)',
                   '(#14.3)',
                   '(#3.79)',
                   '(#6.155)',
                   '(2002-10-10)',
                   '(2003-08-19)',
                   '(2004-11-29)',
                   '(2011-04-06)',
                   'Carte Blanche',
                   'Dangerous Women',
                   'Globos de Ouro 1998',
                   'In Darkness',
                   'Johnny Rockets',
                   'LL Cool J',
                   'No Meringue',
                   'Scavengers',
                   'Space Truckers',
                   'Stop the Presses',
                   'Suffer the Little Children',
                   'The Makeover',
                   'The Real Housewives Confess: A Watch What Happens Special',
                   'Turning Point')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('DTS',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Cantonese',
                    'Dutch',
                    'German',
                    'Greek',
                    'Hindi',
                    'Japanese',
                    'Mandarin',
                    'None',
                    'Russian',
                    'Serbian',
                    'Serbo-Croatian',
                    'Swedish')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer',
                   'miscellaneous crew'));