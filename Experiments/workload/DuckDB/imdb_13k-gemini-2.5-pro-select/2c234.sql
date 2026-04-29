WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND t.title IN ('(#1.6122)',
                   '(#1.659)',
                   '(#15.26)',
                   '(#16.23)',
                   '(#17.58)',
                   '(#17.94)',
                   '(#21.8)',
                   '(#9.120)',
                   '(1993-12-14)',
                   '(2000-01-05)',
                   '(2003-11-25)',
                   '(2004-03-15)',
                   '(2010-04-08)',
                   '(2013-01-14)',
                   '2007 MTV Movie Awards',
                   'Anita',
                   'Big Boss',
                   'Burnout',
                   'Cocktail',
                   'Coming to Terms',
                   'Decline',
                   'Delta',
                   'Dreams and Schemes',
                   'Friend or Foe?',
                   'Go Out with a Bang',
                   'Monster in the Closet',
                   'Nothing Lasts Forever',
                   'Now You See It...',
                   'Occams Razor',
                   'On the Wings of Love',
                   'Pervirella',
                   'Ramona and Beezus',
                   'Running on Empty Dreams',
                   'Science Fiction',
                   'Some Assembly Required',
                   'Tastes Like Chicken',
                   'The Cookout',
                   'The Curious Case of Benjamin Button',
                   'The Rocketeer',
                   'The Shadows',
                   'The Winslow Boy',
                   'Threes Company',
                   'Thuiskomst',
                   'Trevor & Tricia',
                   'Two Families',
                   'Vegas, Baby!',
                   'War of the Worlds',
                   'Wilbur Wants to Kill Himself',
                   'Zimmer frei')
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
  AND rt.role IN ('actor')
  AND it1.id IN ('1')
  AND mi1.info IN ('1',
                    '108',
                    '118',
                    '65',
                    '88',
                    'Germany:42',
                    'UK:3',
                    'USA:52',
                    'USA:83',
                    'USA:99')
  AND it2.id IN ('8')
  AND mi2.info IN ('Czech Republic',
                    'Greece',
                    'Italy',
                    'Netherlands',
                    'Philippines',
                    'Portugal',
                    'Taiwan',
                    'USA',
                    'Venezuela');