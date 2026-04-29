
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND t.title IN ('(#1.1453)',
                   '(#1.332)',
                   '(#1.3503)',
                   '(#1.3788)',
                   '(#1.5288)',
                   '(#10.58)',
                   '(#13.10)',
                   '(#15.21)',
                   '(#16.159)',
                   '(#2.87)',
                   '(#5.24)',
                   '(2000-06-23)',
                   '(2002-01-04)',
                   '(2003-05-16)',
                   '(2005-05-15)',
                   '(2006-08-27)',
                   'Ask the Dust',
                   'Austin Powers: The Spy Who Shagged Me',
                   'Basquiat',
                   'Can You Dig It?',
                   'Del 3',
                   'Do You See What I See?',
                   'Einsichten',
                   'Episode Five',
                   'Expectations',
                   'Homicide',
                   'Immortal Beloved',
                   'Insidious',
                   'Patience',
                   'Red, White and a Little Blue',
                   'Romeo y Julieta',
                   'Running on Empty',
                   'Saru gecchu 3',
                   'Secret Society',
                   'Tess',
                   'The Big Bang Theory',
                   'The Firm',
                   'The Mummy: Tomb of the Dragon Emperor',
                   'The Sting')
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adult',
                    'Adventure',
                    'Biography',
                    'Drama',
                    'Family',
                    'Game-Show',
                    'Horror',
                    'Music',
                    'Musical',
                    'Mystery',
                    'News',
                    'Reality-TV',
                    'Sci-Fi',
                    'Thriller',
                    'Western')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'Czech Republic',
                    'Indonesia',
                    'Mexico',
                    'Nigeria')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
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
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'guest',
                   'producer'));