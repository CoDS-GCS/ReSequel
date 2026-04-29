
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
  AND t.title IN ('(#5.18)',
                   '(#6.23)',
                   'A Dolls House',
                   'A beszélö köntös',
                   'Dead or Alive',
                   'Der Feldherrnhügel',
                   'Der Unfall',
                   'Fall Guy',
                   'Illegal Entry',
                   'Its a Wonderful World',
                   'Its in the Air',
                   'Judith',
                   'Rocambole',
                   'The Connection',
                   'The King of Kings')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('CBS Studio 50, New York City, New York, USA',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
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
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'editor',
                   'writer'));