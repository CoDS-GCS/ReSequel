WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.132)',
                   '(#1.3383)',
                   '(#1.3633)',
                   '(#1.775)',
                   '(#17.36)',
                   '(#19.15)',
                   '(#7.166)',
                   '(2000-10-19)',
                   '(2002-06-18)',
                   '(2003-12-04)',
                   '(2008-07-27)',
                   '(2013-05-01)',
                   'A Brady, a Lady, a Kiss and a Flo',
                   'All My Children',
                   'BET Awards 2009',
                   'Brendan Fraser',
                   'Burning Palms',
                   'Die Falle',
                   'Elephant in the Room',
                   'Final Countdown',
                   'I Want Candy',
                   'Love in Bloom',
                   'Major League II',
                   'Neubeginn',
                   'One More for the Road',
                   'Seth McFarlane & Norah Jones',
                   'Shallow Water, Oh Mama',
                   'The Dark Knight',
                   'The Manson Family',
                   'Weight Loss')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
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
   WHERE ROLE IN ('actress',
                   'cinematographer',
                   'composer',
                   'producer',
                   'writer'))
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
  AND mi2.info IN ('Bulgaria',
                    'Croatia',
                    'Cuba',
                    'Denmark',
                    'Germany',
                    'Greece',
                    'Hong Kong',
                    'Iran',
                    'Portugal',
                    'Thailand');