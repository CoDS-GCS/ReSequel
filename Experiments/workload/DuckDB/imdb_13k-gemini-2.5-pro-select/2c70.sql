
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
  AND t.title IN ('(#1.64)',
                   '(#4.10)',
                   '(#4.22)',
                   'Anastasia',
                   'Aoi sanmyaku',
                   'Arizona',
                   'Der Meineidbauer',
                   'Designing Woman',
                   'Die Fledermaus',
                   'Game 4',
                   'Handle with Care',
                   'Heat Wave',
                   'Hypnotized',
                   'Kill or Cure',
                   'Last Chance',
                   'Law and Disorder',
                   'Line of Fire',
                   'Magnificent Obsession',
                   'Maratón',
                   'My Fair Lady',
                   'New Musical Express Poll Winners Concert',
                   'Rebellion',
                   'See No Evil',
                   'Six Bridges to Cross',
                   'Stagecoach',
                   'The Call of the Wild',
                   'The Countess',
                   'The Gilded Lily',
                   'The Hospital',
                   'The Invisible Man',
                   'The Prince and the Pauper',
                   'Unusual Occupations',
                   'Washington Story')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Silent',
                    'Stereo')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Berlin, Germany',
                    'Buenos Aires, Federal District, Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew'));