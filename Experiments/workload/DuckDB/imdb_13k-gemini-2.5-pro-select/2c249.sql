WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1990 AND 2015
     AND title IN ('(#1.1341)',
                   '(#1.2012)',
                   '(#1.6081)',
                   '(#1.76)',
                   '(#2.108)',
                   '(#5.6)',
                   '(#9.100)',
                   '(#9.27)',
                   '(2001-04-25)',
                   '(2001-07-19)',
                   '(2005-12-12)',
                   '(2008-08-14)',
                   '(2009-04-11)',
                   '(2010-01-19)',
                   '(2010-12-15)',
                   '(2011-12-08)',
                   '(2012-07-06)',
                   'A Day Without a Mexican',
                   'Amores de estafa',
                   'Bed, Bath and Beyond',
                   'Booted',
                   'Born Again',
                   'Chapter 21',
                   'Charlie & Boots',
                   'Clean Break',
                   'Dad',
                   'Dire Straits',
                   'Guerillas in the Mist',
                   'Happy Hour',
                   'Hazaaron Khwaishein Aisi',
                   'Keeping Up with the Joneses',
                   'Matti',
                   'My Big Fat Greek Wedding',
                   'Needle in the Hay',
                   'Quentin Tarantino/Smashing Pumpkins',
                   'SUBWAYStories: Tales from the Underground',
                   'Say It Loud',
                   'Slip of the Tongue',
                   'Space Invaders',
                   'Super Inday and the Golden Bibe',
                   'Suzuran',
                   'The Devil',
                   'The Football Factory',
                   'The Trainer',
                   'The Van',
                   'You Changed My Life')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('movie',
                   'tv movie',
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
   WHERE ROLE IN ('editor',
                   'miscellaneous crew',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('8')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('Chile',
                    'France',
                    'Malaysia',
                    'Portugal',
                    'Singapore',
                    'Sweden',
                    'Taiwan',
                    'UK',
                    'Venezuela');