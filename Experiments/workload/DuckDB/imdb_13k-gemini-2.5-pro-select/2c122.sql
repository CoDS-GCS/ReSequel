WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.3418)',
                   '(#7.140)',
                   '(2008-05-12)',
                   '(2008-05-28)',
                   'A Matter of Principle',
                   'All My Children',
                   'Be Cool',
                   'Birds of Paradise',
                   'Blood and Wine',
                   'Do the Wrong Thing',
                   'Less Than 30',
                   'Look Again',
                   'Natural Selection',
                   'Rumble Fish',
                   'The Farmers Wife',
                   'The Flip Side',
                   'The Imposters',
                   'The Long and Winding Road',
                   'The Lost',
                   'Things That Go Bump in the Night',
                   'Uninvited Guests')
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
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'costume designer',
                   'guest',
                   'miscellaneous crew',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('4-Track Stereo',
                    'Datasat',
                    'Dolby Digital EX',
                    'Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Silent')
  AND mi2.info IN ('Black and White',
                    'Color');