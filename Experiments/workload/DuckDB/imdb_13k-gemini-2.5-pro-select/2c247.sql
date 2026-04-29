
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
  AND t.title IN ('(#3.28)',
                   '(#6.11)',
                   'Always Leave Them Laughing',
                   'Assassin',
                   'Cinderella',
                   'College Holiday',
                   'Dr. Jekyll and Mr. Hyde',
                   'Four Sons',
                   'It Started with Eve',
                   'Maratón',
                   'Nocturne',
                   'Peter Pan',
                   'Ricochet',
                   'Samson and Delilah',
                   'Scandal Sheet',
                   'Springtime in the Rockies',
                   'State of the Union',
                   'The Other Man',
                   'The Philadelphia Story',
                   'The Showdown',
                   'The Visitors',
                   'The Widow')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('11',
                    '25',
                    '72',
                    '73',
                    '74',
                    '78',
                    '81',
                    '84',
                    '87',
                    '9',
                    '91',
                    '96',
                    'USA:20')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
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
     WHERE ROLE IN ('actress',
                   'costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew'));