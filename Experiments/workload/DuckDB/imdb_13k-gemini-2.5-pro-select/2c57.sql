WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.301)',
                   '(#1.51)',
                   '(#3.16)',
                   '(#8.22)',
                   'A Change of Heart',
                   'Arrival',
                   'Atlanta Falcons vs. Philadelphia Eagles',
                   'Big Business',
                   'Cant Stop the Music',
                   'Fun House',
                   'La traviata',
                   'Life of Brian',
                   'Please Believe Me',
                   'The 34th Annual Emmy Awards',
                   'The Appointment',
                   'The Bachelor Party',
                   'The Big Parade of Comedy',
                   'The Love God?',
                   'The Outsiders',
                   'The Ratings Game',
                   'The Shower',
                   'To Catch a Thief',
                   'Witch Hunt')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
                   'video game',
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
   WHERE ROLE IN ('miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Adult',
                    'Fantasy',
                    'Game-Show',
                    'Horror',
                    'Musical')
  AND mi2.info IN ('CAM:Panaflex Camera and Lenses by Panavision',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'LAB:Film Center, Mumbai, India',
                    'LAB:Movielab, USA',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'OFM:16 mm',
                    'PCS:Panavision',
                    'PCS:Tohoscope',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:4:3');