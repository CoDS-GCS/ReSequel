
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON it1.id IN ('1')
JOIN movie_info AS mi1 ON mi1.info_type_id = it1.id
AND t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE it2.id IN ('3')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('55',
                    '6',
                    '86',
                    'USA:50',
                    'USA:95')
  AND mi2.info IN ('Action',
                    'Biography',
                    'Comedy',
                    'Documentary',
                    'Film-Noir',
                    'History',
                    'Mystery',
                    'Romance',
                    'Short',
                    'Thriller')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('director',
                   'guest',
                   'miscellaneous crew')
  AND n.gender IN ('m')
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#1.72)',
                   '(#3.2)',
                   '(#3.23)',
                   '(#5.4)',
                   '(#6.4)',
                   'A Place in the Sun',
                   'Blind Spot',
                   'Brotherly Love',
                   'Countdown',
                   'Der Raub der Sabinerinnen',
                   'Diane',
                   'Eyewitness',
                   'False Witness',
                   'Florian',
                   'Fury',
                   'Gasparone',
                   'Golden Boy',
                   'Lilith',
                   'Martha',
                   'One Foot in Heaven',
                   'Perfect Strangers',
                   'Reckless',
                   'Shine on Harvest Moon',
                   'Stingaree',
                   'Take Me Out to the Ball Game',
                   'The Appointment',
                   'The Comeback',
                   'The Engagement',
                   'The Fanatics',
                   'The Feud',
                   'The Good Samaritan',
                   'The Great Ziegfeld',
                   'The Hoodlum Saint',
                   'The Raven',
                   'The Women',
                   'War and Peace',
                   'With a Song in My Heart');