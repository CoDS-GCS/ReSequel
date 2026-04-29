WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.218)',
                   '(#1.442)',
                   '(#1.553)',
                   '(#2.50)',
                   'Flesh Gordon Meets the Cosmic Cheerleaders',
                   'Funny Girl',
                   'Gas',
                   'Gold Fever',
                   'Home Sweet Home',
                   'Home',
                   'Illegally Yours',
                   'Jaws 3-D',
                   'Miyamoto Musashi',
                   'Reflections',
                   'The Doctors',
                   'The Patsy',
                   'The Plays the Thing',
                   'The Sniper',
                   'The Windfall',
                   'Vicious Circle')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
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
   WHERE ROLE IN ('writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo');