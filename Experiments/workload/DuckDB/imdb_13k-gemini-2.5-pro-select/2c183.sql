WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.5295)',
                   '(#9.85)',
                   '(1995-07-19)',
                   '(1998-10-27)',
                   '100 Greatest Stand-Ups',
                   'A New Beginning',
                   'Charlie Sheen',
                   'Hiling',
                   'Know Thy Enemy',
                   'Sudden Impact')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'British Columbia, Canada',
                    'Miami, Florida, USA',
                    'New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Santa Monica, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Stage 24, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 29, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Stage 37, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Stage 8, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'USA',
                    'Vancouver, British Columbia, Canada')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'SDDS',
                    'Stereo',
                    'Ultra Stereo');