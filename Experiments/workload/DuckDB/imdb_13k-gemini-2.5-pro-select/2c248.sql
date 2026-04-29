WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1990
     AND t.production_year >= 1950
     AND t.title IN ('(#1.17)',
                   '(#1.294)',
                   '(#1.342)',
                   '(#1.404)',
                   '(#1.416)',
                   '(#1.535)',
                   '(#1.619)',
                   '(#1.648)',
                   '(#1.840)',
                   '(#1.898)',
                   '(#10.2)',
                   '(#3.34)',
                   'A Touch of the Sun',
                   'Ace in the Hole',
                   'Act of Vengeance',
                   'And Baby Makes Two',
                   'As You Like It',
                   'Belinda',
                   'Concealed Enemies, Part I: Suspicion',
                   'Crossroads',
                   'Dead Mans Shoes',
                   'Do It Yourself',
                   'Family Reunion',
                   'First Date',
                   'Ghost in the Machine',
                   'Haunted House',
                   'Hero',
                   'Hotel Polan und seine Gäste',
                   'Karate',
                   'King of the Gypsies',
                   'La gran familia',
                   'Limbo',
                   'Marina',
                   'Night of 100 Stars III',
                   'No Way Out',
                   'Of Human Bondage',
                   'Othello',
                   'Retribution',
                   'Shadow Play',
                   'Ten Little Indians',
                   'The Boarder',
                   'The Circus',
                   'The Hound of the Baskervilles',
                   'The Moonlighter',
                   'The Silver Chalice',
                   'The Thoroughbred',
                   'The Unholy',
                   'Washington Redskins vs. New York Giants')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('6')
  AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo');