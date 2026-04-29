WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.152)',
                   '(#1.338)',
                   '(#1.375)',
                   '(#1.837)',
                   '(#1.962)',
                   '(#11.7)',
                   '(#3.6)',
                   '(#4.35)',
                   'Alien Nation',
                   'Amadeus',
                   'Arena',
                   'Arrivederci Roma',
                   'Astonished',
                   'Blind Spot',
                   'Carrie',
                   'For Love or Money',
                   'Friends and Enemies',
                   'Full House',
                   'Generations',
                   'Happy Birthday',
                   'Head Over Heels',
                   'Les guignols de linfo',
                   'Los Angeles Rams vs. New Orleans Saints',
                   'Moving Targets',
                   'One More Time',
                   'Saturday Night',
                   'Sunset',
                   'Sweet Lorraine',
                   'Taken for a Ride',
                   'Thats Entertainment!',
                   'The 35th Annual Emmy Awards',
                   'The Bargain',
                   'The Best Little Whorehouse in Texas',
                   'The Hero',
                   'The Legacy',
                   'The Muppets: A Celebration of 30 Years',
                   'The Prisoner of Zenda',
                   'The Rose',
                   'The Scavengers',
                   'The Threat')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
   WHERE ROLE IN ('composer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('5')
  AND mi1.info IN ('113',
                    '115',
                    '121',
                    '123',
                    '125',
                    '130',
                    '75',
                    '83',
                    '99',
                    'USA:102',
                    'USA:85',
                    'USA:86',
                    'USA:88',
                    'USA:98')
  AND mi2.info IN ('Australia:R',
                    'Germany:12',
                    'Norway:16',
                    'Portugal:M/18',
                    'UK:PG',
                    'USA:G',
                    'USA:Passed',
                    'West Germany:6');