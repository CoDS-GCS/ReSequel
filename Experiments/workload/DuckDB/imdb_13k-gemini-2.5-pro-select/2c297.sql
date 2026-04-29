WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year >= 1925
     AND t.title IN ('(#1.114)',
                   '(#1.3445)',
                   '(#2.62)',
                   '(#6.96)',
                   '(2009-03-06)',
                   '(2009-08-31)',
                   '(2011-12-11)',
                   'Adjust Your Tracking',
                   'Am Ende des Tages',
                   'Bad Behaviour',
                   'Blast',
                   'Bless the Child',
                   'Day 100: Finale',
                   'Fait Accompli',
                   'Fear and Loathing in Las Vegas',
                   'French Kiss',
                   'Front Mission 4',
                   'Gate Keepers',
                   'Gaviotas blindadas 3',
                   'Happy on the Ground: 8 Days at GRAMMY Camp®',
                   'Introduction',
                   'Issues',
                   'Joyride',
                   'La traición',
                   'Namets!',
                   'No Contest',
                   'Oil & Water',
                   'Rearview',
                   'Ridicule',
                   'Suomen Robinson',
                   'The Believers',
                   'The Haunted Piano',
                   'The Knockout',
                   'Ursula')
     AND kt.kind IN ('episode',
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
                   'guest',
                   'production designer',
                   'writer')),
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
WHERE mi2.info_type_id IN ('4')
  AND mi2.info IN ('Albanian',
                    'Bengali',
                    'Bulgarian',
                    'Cantonese',
                    'Filipino',
                    'Georgian',
                    'Hebrew',
                    'Hungarian',
                    'Japanese',
                    'Portuguese',
                    'Russian',
                    'Slovak',
                    'Thai');