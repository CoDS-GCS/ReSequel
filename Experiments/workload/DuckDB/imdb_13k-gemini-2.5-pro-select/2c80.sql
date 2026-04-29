WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.103)',
                   '(#1.12)',
                   '(#1.52)',
                   '(#3.13)',
                   '(#4.9)',
                   '(#6.19)',
                   '(#6.24)',
                   'A Midsummer Nights Dream',
                   'All Star Comedy Carnival',
                   'Batman',
                   'Charleys Tante',
                   'Crossfire',
                   'Der Hexer',
                   'Down on the Farm',
                   'Great Expectations',
                   'Homecoming',
                   'Its a Small World',
                   'Manhunt',
                   'Many Happy Returns',
                   'Marriage',
                   'Ningen no jôken',
                   'Parnell',
                   'Play School',
                   'Premiere',
                   'Rhubarb',
                   'Robin Hood',
                   'Safari',
                   'Spartacus',
                   'The Auction',
                   'The Baby Sitter',
                   'The Big Noise',
                   'The Bounty Hunter',
                   'The Brothers',
                   'The Chaser',
                   'The Man Outside',
                   'The Photographer',
                   'The Spider',
                   'The Unwanted',
                   'The Wild Bunch',
                   'The Wrong Man',
                   'Tower of London')
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
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'miscellaneous crew',
                   'production designer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('Iceland:12',
                    'Sweden:15',
                    'UK:18',
                    'USA:G',
                    'West Germany:16')
  AND mi2.info IN ('Action',
                    'Adult',
                    'Adventure',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'History',
                    'Horror',
                    'Mystery',
                    'Sci-Fi');