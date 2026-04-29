WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.417)',
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
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'director',
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
WHERE mi1.info_type_id IN ('7')
  AND mi2.info_type_id IN ('3')
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