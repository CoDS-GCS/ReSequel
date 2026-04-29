WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.152)',
                   '(#1.416)',
                   '(#1.798)',
                   '(#1.840)',
                   '(#2.14)',
                   '(#8.13)',
                   'AFL-NFL World Championship Game',
                   'All the Way',
                   'Der Unfall',
                   'Flashback',
                   'Higher Education',
                   'Is There a Doctor in the House?',
                   'Julia',
                   'Lover Boy',
                   'My Blue Heaven',
                   'Revolution',
                   'Scorpion',
                   'The 41st Annual Golden Globe Awards',
                   'The Amateur',
                   'The Boy Next Door',
                   'The Confession',
                   'The Fashion Show',
                   'The Long Walk Home',
                   'The Visitor')
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
   WHERE ROLE IN ('actor',
                   'actress',
                   'editor',
                   'miscellaneous crew',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('6')
  AND mi1.info IN ('Belgium',
                    'Canada',
                    'Czechoslovakia',
                    'Georgia',
                    'Greece',
                    'India',
                    'Poland',
                    'Portugal',
                    'Switzerland',
                    'UK')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Silent',
                    'Stereo');