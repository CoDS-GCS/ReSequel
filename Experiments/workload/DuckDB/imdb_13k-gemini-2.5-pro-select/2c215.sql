WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.79)',
                   '(#1.87)',
                   '(#2.4)',
                   '(#3.24)',
                   '(#3.5)',
                   '(#7.9)',
                   'Dick Tracy Returns',
                   'Excuse My Dust',
                   'Jeanne Eagels',
                   'Parnell',
                   'Shadows',
                   'St. Louis Blues',
                   'The Fanatics',
                   'The Warning')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'editor',
                   'producer',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('70 mm 6-Track',
                    'Dolby Digital',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Australia:PG',
                    'Canada:G',
                    'Norway:16',
                    'Spain:T',
                    'USA:TV-G',
                    'West Germany:18',
                    'West Germany:6');