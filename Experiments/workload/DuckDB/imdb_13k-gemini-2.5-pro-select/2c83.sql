WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND t.title IN ('(#1.1995)',
                   '(#1.5463)',
                   '(#1.5516)',
                   '(#1.6173)',
                   '(#6.189)',
                   '(#6.43)',
                   '(#9.44)',
                   '(1998-09-11)',
                   '(2004-01-25)',
                   '(2004-02-07)',
                   '(2004-09-25)',
                   '(2004-12-17)',
                   '(2005-05-23)',
                   '(2005-08-27)',
                   '(2006-05-06)',
                   'A Year and a Day',
                   'AmerAsian',
                   'Apples',
                   'Bratz',
                   'BrightStar Care',
                   'Chapter Twelve',
                   'Cámara negra. Teatro Victoria Eugenia',
                   'Die Fremde',
                   'Fainaru fantajî XII',
                   'Family Affair',
                   'Final Grades',
                   'Grassroots',
                   'Green Dress for Red Carpet',
                   'Horsemen',
                   'July',
                   'King',
                   'Lifes a Beach',
                   'Money, Money, Money',
                   'Mr. Saturday Night',
                   'Personal Story/Memorable Year Week',
                   'Playing Doctor',
                   'Schutzengel',
                   'Secret défense',
                   'Street Life',
                   'Terrible Twos',
                   'The Birds and the Bees',
                   'The Gift of Life',
                   'The Housemates Patience Are Tested to the Max',
                   'The People vs. George Lucas',
                   'The Thief',
                   'Timebomb',
                   'Town of Tomorrow',
                   'Whacked!',
                   'While the Cats Away')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
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
  AND rt.role IN ('composer',
                   'director',
                   'editor',
                   'production designer',
                   'writer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Action',
                    'Adult',
                    'Biography',
                    'Crime',
                    'Documentary',
                    'Mystery',
                    'News',
                    'Reality-TV',
                    'Sci-Fi',
                    'Sport',
                    'Talk-Show',
                    'Western')
  AND it2.id IN ('6')
  AND mi2.info IN ('Datasat',
                    'Dolby',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo');