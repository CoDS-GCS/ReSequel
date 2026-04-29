WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.134)',
                   '(#1.161)',
                   '(#1.170)',
                   '(#1.208)',
                   '(#1.219)',
                   '(#1.287)',
                   '(#1.317)',
                   '(#1.374)',
                   '(#1.422)',
                   '(#1.826)',
                   '(#5.33)',
                   '(#6.20)',
                   'A Hard Days Night',
                   'A Young Mans Fancy',
                   'Act of Violence',
                   'And the Winner Is...',
                   'Back to the Beach',
                   'Body Rock',
                   'Boy Meets Girl',
                   'Catspaw',
                   'Change of Heart',
                   'Day One',
                   'Die gefrorenen Blitze',
                   'Entente Cordiale',
                   'Family of Spies',
                   'Father and Son',
                   'Female of the Species',
                   'Inherit the Wind',
                   'Its Your Move',
                   'Made for Each Other',
                   'Mihai Viteazul',
                   'Night School',
                   'Nighthawks',
                   'No Place Like Home',
                   'Once a Thief',
                   'Out of the Past',
                   'Scared Stiff',
                   'School Daze',
                   'Tango',
                   'The Ambulance',
                   'The Band Wagon',
                   'The Bank Job',
                   'The Chilling',
                   'The Gamblers',
                   'The Meeting',
                   'The Milkman',
                   'Weird Science')
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
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
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
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('Belgium',
                    'Bulgaria',
                    'East Germany',
                    'Indonesia',
                    'Pakistan',
                    'Portugal',
                    'South Korea',
                    'Venezuela')
  AND mi2.info IN ('Dutch',
                    'Filipino',
                    'Hebrew',
                    'Hungarian',
                    'Korean');