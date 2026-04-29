
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
                   '(#1.108)',
                   '(#1.121)',
                   '(#4.22)',
                   '(#5.10)',
                   'A Dispatch from Reuters',
                   'Az aranyember',
                   'Caroline chérie',
                   'Carrie',
                   'Conspiracy',
                   'Follow the Sun',
                   'Fools Gold',
                   'Forbidden',
                   'Game 5',
                   'Gilda',
                   'Happy Landing',
                   'Manpower',
                   'Melodi grand prix',
                   'Mrs. Miniver',
                   'My Sister Eileen',
                   'No Way Out',
                   'One Sunday Afternoon',
                   'Open House',
                   'Over the Wall',
                   'Pressure Point',
                   'Sister Kenny',
                   'Smart Woman',
                   'Springtime in the Rockies',
                   'Success Story',
                   'The Choice',
                   'The Experiment',
                   'The Man',
                   'The Princess',
                   'The Scarlet Pimpernel',
                   'The Traitor',
                   'The Triangle',
                   'The Virginian',
                   'Three Men in a Boat',
                   'Tosca')
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('104',
                    '106',
                    '11',
                    '22',
                    '25',
                    '5',
                    '54',
                    '55',
                    '64',
                    '66',
                    '7',
                    '88',
                    '91',
                    'USA:50',
                    'USA:7')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer'));