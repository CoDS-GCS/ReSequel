WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year >= 1925
     AND t.title IN ('(#1.123)',
                   '(#1.17)',
                   '(#1.18)',
                   '(#1.4)',
                   '(#1.60)',
                   '(#5.12)',
                   '(#6.13)',
                   'A Cry for Help',
                   'Backlash',
                   'Bad Guy',
                   'Bad Medicine',
                   'Carnival',
                   'Conspiracy',
                   'Foreign Correspondent',
                   'Hot Money',
                   'Inferno',
                   'Mutiny on the Bounty',
                   'Party Girl',
                   'Reunion in France',
                   'Richard II Part 2: The Deposing of a King',
                   'Samson and Delilah',
                   'Saturday Night',
                   'Stree',
                   'The Drifter',
                   'The Gamble',
                   'The Gun',
                   'The Human Comedy',
                   'The Opposite Sex',
                   'The Outcast',
                   'The Outsider',
                   'The Rescue',
                   'The Scavengers',
                   'The Sniper',
                   'The Wrecker',
                   'Thirty Seconds Over Tokyo',
                   'Whom the Gods Destroy',
                   'Young Love')
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game')),
     t_kt_ci AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN cast_info AS ci ON t_kt.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND rt.role IN ('cinematographer')),
     t_kt_ci_mi1 AS
  (SELECT t_kt_ci.id
   FROM t_kt_ci
   JOIN movie_info AS mi1 ON t_kt_ci.id = mi1.movie_id
   WHERE mi1.info_type_id IN ('6')
     AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Mono',
                    'Stereo'))
SELECT COUNT(*)
FROM t_kt_ci_mi1
JOIN movie_info AS mi2 ON t_kt_ci_mi1.id = mi2.movie_id
WHERE mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adult',
                    'Biography',
                    'Comedy',
                    'Documentary',
                    'Music',
                    'Romance',
                    'Short',
                    'Western');