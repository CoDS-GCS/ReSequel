WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.334)',
                   '(#1.742)',
                   '(#3.22)',
                   '(#3.49)',
                   '(#6.25)',
                   '1986 NFL Draft',
                   'All at Sea',
                   'All in the Family',
                   'Attack',
                   'Bozská Ema',
                   'Double Cross',
                   'Ellis Island',
                   'Six Pack',
                   'SportsCenter',
                   'The Affair',
                   'The Bigger They Are',
                   'The Witness',
                   'Too Many Cooks')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv series',
                   'video game'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'miscellaneous crew',
                   'writer'))
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