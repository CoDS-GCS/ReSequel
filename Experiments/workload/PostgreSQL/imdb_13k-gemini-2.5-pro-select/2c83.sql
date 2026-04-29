
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1990
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
  AND mi1.info_type_id IN ('3')
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
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Datasat',
                    'Dolby',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'editor',
                   'production designer',
                   'writer'));