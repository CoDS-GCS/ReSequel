WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.1248)',
                   '(#16.180)',
                   '(1999-10-20)',
                   '(2008-01-18)',
                   '(2008-02-13)',
                   'Hugh Jackman',
                   'Lily',
                   'Lindsay Lohan',
                   'Madness & Mayhem 2',
                   'Show Me Your Hits',
                   'Species',
                   'The Bus')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
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
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('6-Track Stereo',
                    '70 mm 6-Track',
                    'DTS',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info IN ('Animation',
                    'Biography',
                    'Crime',
                    'Game-Show',
                    'History',
                    'Musical',
                    'Short');