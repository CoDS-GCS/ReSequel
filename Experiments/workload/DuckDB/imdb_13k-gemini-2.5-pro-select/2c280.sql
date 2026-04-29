
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1925
  AND t.title IN ('(#13.43)',
                   '(#4.138)',
                   '(#8.159)',
                   '(2002-10-02)',
                   '(2006-02-17)',
                   '(2006-05-04)',
                   '(2009-07-09)',
                   '(2013-01-25)',
                   'Blame',
                   'Blind Love',
                   'Bliss',
                   'Cosmopolitan',
                   'Cuckoos Nest',
                   'Denver Broncos vs. San Diego Chargers',
                   'Dunston Checks In',
                   'Enfermés dehors',
                   'Eurolaul',
                   'Four Days',
                   'Francesco Carrozzini',
                   'Hands Across the Sea',
                   'Heaven and Earth',
                   'I Think I Love My Wife',
                   'Just Add Water',
                   'Kid Millions',
                   'Liberty Stands Still',
                   'Metallica: S&M',
                   'Ned Kelly',
                   'Poultrygeist: Night of the Chicken Dead',
                   'Problem Child',
                   'Schwestern',
                   'Seven Keys to Baldpate',
                   'Stagecoach',
                   'Student Affairs',
                   'Sweet Sixteen',
                   'Tenderness',
                   'The Luck of the Irish',
                   'The Picture',
                   'The Quality of Life',
                   'Visa')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('DTS',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby SR',
                    'SDDS')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Berlin, Germany',
                    'Chicago, Illinois, USA',
                    'Melbourne, Victoria, Australia',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Studio 8H, NBC Studios - 30 Rockefeller Plaza, Manhattan, New York City, New York, USA',
                    'Washington, District of Columbia, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'composer',
                   'editor',
                   'guest',
                   'writer'));