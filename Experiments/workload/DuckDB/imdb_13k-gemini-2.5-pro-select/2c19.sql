WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1990
     AND t.production_year >= 1950
     AND t.title IN ('(#1.36)',
                   '(#1.373)',
                   '(#1.485)',
                   '(#1.503)',
                   '(#1.530)',
                   '(#1.574)',
                   '(#10.1)',
                   '(#2.31)',
                   '(#3.9)',
                   '(#6.15)',
                   'A Place in the Sun',
                   'American Raspberry',
                   'Bad Influence',
                   'Body Language',
                   'Boy Meets Girl',
                   'Buffalo Bills vs. Miami Dolphins',
                   'Designing Woman',
                   'El puente',
                   'Fly Away Home',
                   'Funny Money',
                   'Ghost Writer',
                   'I Spy',
                   'I promessi sposi',
                   'Paper Chase',
                   'Paulette, la pauvre petite milliardaire',
                   'Rape',
                   'Take Me to Your Leader',
                   'The Assassin',
                   'The Dentist',
                   'The End of the World',
                   'The Great Muppet Caper',
                   'The High and the Mighty',
                   'The Man from Snowy River II',
                   'The Merry Widow',
                   'The Morning After',
                   'The Outcast',
                   'The Rousters',
                   'The Thin Red Line',
                   'The Tragedy of King Lear',
                   'The Woman',
                   'Tilt',
                   'Transitions',
                   'Yerma')
     AND kt.kind IN ('movie',
                   'tv movie',
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
     AND rt.role IN ('cinematographer',
                   'costume designer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('6')
     AND mi1.info IN ('70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Denmark',
                    'Hong Kong',
                    'India',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Romania',
                    'Sweden',
                    'UK',
                    'Yugoslavia');