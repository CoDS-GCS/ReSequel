WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('Amazon Women on the Moon',
                   'Body Slam',
                   'Die Entführung',
                   'Earthquake',
                   'Executive Action',
                   'Honor Bound',
                   'Man and Boy',
                   'Robbery',
                   'Supergirl',
                   'The Critic',
                   'The Incident',
                   'Total Recall')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
   WHERE ROLE IN ('costume designer',
                   'editor',
                   'miscellaneous crew',
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
  AND mi1.info IN ('4-Track Stereo',
                    'DTS',
                    'Dolby Digital',
                    'Dolby Stereo',
                    'Dolby',
                    'Mono',
                    'Ultra Stereo')
  AND mi2.info IN ('Australia:G',
                    'Australia:M',
                    'Finland:K-8',
                    'Germany:12',
                    'Iceland:12',
                    'Netherlands:AL',
                    'UK:X',
                    'USA:TV-G');