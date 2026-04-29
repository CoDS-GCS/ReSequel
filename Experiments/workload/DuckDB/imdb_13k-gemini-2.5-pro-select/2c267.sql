WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.1082)',
                   '(#1.213)',
                   '(#1.456)',
                   '(#1.489)',
                   '(#1.499)',
                   '(#1.638)',
                   '(#1.682)',
                   'Amazon Women on the Moon',
                   'As Time Goes By',
                   'As You Like It',
                   'Bellbird',
                   'Cabin Fever',
                   'Cash and Carry',
                   'Christmas Show',
                   'Christmas Special',
                   'Countdown',
                   'Cry for Help',
                   'Dear Mom and Dad',
                   'Discipline',
                   'God Bless the Child',
                   'Great Expectations',
                   'Hairspray',
                   'Hemingway',
                   'Ill Be Seeing You',
                   'Ivanhoe',
                   'La porteuse de pain',
                   'Macbeth',
                   'Magnum Force',
                   'Murder Rap',
                   'New York Giants vs. St. Louis Cardinals',
                   'Night Club',
                   'Operation Petticoat',
                   'Road Lawyers and Other Briefs',
                   'Shogun',
                   'Smile',
                   'Superstition',
                   'Teachers',
                   'The Best of Everything',
                   'The Big Job',
                   'The Gamble',
                   'The Kidnapping',
                   'The Last Enemy',
                   'The Pigeon',
                   'The Raid',
                   'The Story of Will Rogers',
                   'The Strongest Man in the World',
                   'The Tender Trap',
                   'Ties That Bind')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'miscellaneous crew')
  AND it1.id IN ('3')
  AND mi1.info IN ('Biography',
                    'Fantasy',
                    'Game-Show',
                    'Music',
                    'Musical',
                    'Romance',
                    'Sport',
                    'Western')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');