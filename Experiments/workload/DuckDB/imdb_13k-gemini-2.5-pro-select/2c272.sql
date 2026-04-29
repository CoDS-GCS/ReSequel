WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.1082)',
                   '(#1.245)',
                   '(#11.20)',
                   '(#2.65)',
                   '(#3.20)',
                   '(1989-01-09)',
                   'Born on the Fourth of July',
                   'Brothers Keeper',
                   'Bullseye!',
                   'Cyclone',
                   'Fast Food',
                   'Half a Sixpence',
                   'Heimlichkeiten',
                   'Hideout',
                   'Hollywood Shuffle',
                   'Housewarming',
                   'Lady Sings the Blues',
                   'Paradise Alley',
                   'Revolution',
                   'The Ambulance',
                   'The Best Man',
                   'The Great Muppet Caper',
                   'Under Pressure',
                   'Wedding Bell Blues',
                   'Working Girl')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie',
                   'tv series',
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
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Austria',
                    'Bulgaria',
                    'Canada',
                    'Czechoslovakia',
                    'Hong Kong',
                    'India',
                    'Italy',
                    'Mexico',
                    'Portugal',
                    'Soviet Union',
                    'Spain',
                    'UK',
                    'USA');