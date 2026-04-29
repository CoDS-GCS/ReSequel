
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.417)',
                   '(#1.6103)',
                   '(#1.6237)',
                   '(#1.6255)',
                   '(#12.94)',
                   '(#18.21)',
                   '(#2.151)',
                   '(#22.21)',
                   '(#3.77)',
                   '(1997-02-13)',
                   '(1997-03-19)',
                   '(2003-12-12)',
                   '(2010-01-21)',
                   '(2010-11-25)',
                   'A Bird in the Hand',
                   'Amália',
                   'Auditions: Los Angeles',
                   'Buenos Aires',
                   'Ces amours-là',
                   'Chapter Seventeen',
                   'Chicago Bears vs. St. Louis Rams',
                   'Chink',
                   'Clarity',
                   'Cthulhu',
                   'Damaged Goods',
                   'Die Hard',
                   'Emission Impossible',
                   'Full Court Press',
                   'Full Hearts',
                   'Grand Theft Auto IV',
                   'Home and Away',
                   'House of Blues',
                   'Ive Fallen for You',
                   'Jao Sees a New Side of Mikay',
                   'Lola: Érase una vez',
                   'Moses',
                   'Once in a Blue Moon',
                   'One in a Million',
                   'Rosenstrasse',
                   'Texas Justice',
                   'The Bride',
                   'The Comeback',
                   'The Dickensian Aspect',
                   'The Hillz',
                   'The Things We Do',
                   'Tony Hawk',
                   'Vanishing Point',
                   'Veterans Day',
                   'Wettlauf mit der Zeit',
                   'World Wide Wrestling')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND it1.id IN ('7')
  AND it2.id IN ('3')
  AND mi1.info IN ('CAM:Canon XH-A1',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'LAB:Technicolor, UK',
                    'OFM:HD',
                    'PCS:Panavision')
  AND mi2.info IN ('Action',
                    'Drama',
                    'Fantasy',
                    'Music',
                    'Musical',
                    'Reality-TV',
                    'Short');