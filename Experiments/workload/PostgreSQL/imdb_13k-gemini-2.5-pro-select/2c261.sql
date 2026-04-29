WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.113)',
                   '(#1.137)',
                   '(#1.249)',
                   '(#1.284)',
                   '(#1.630)',
                   '(#1.657)',
                   '(#1.665)',
                   '(#1.831)',
                   '(#2.22)',
                   '(#3.11)',
                   '(#5.14)',
                   '(#5.20)',
                   'A Girls Best Friend',
                   'All Star Comedy Carnival',
                   'Another 48 Hrs.',
                   'April in Paris',
                   'Bad Medicine',
                   'Birthday Boy',
                   'Blind Spot',
                   'Chain Gang',
                   'Edward Scissorhands',
                   'Fatal Attraction',
                   'Guardian Angel',
                   'Juggernaut',
                   'Midnight',
                   'Most',
                   'Night Train',
                   'No Margin for Error',
                   'Of Human Bondage',
                   'Operation Warzone',
                   'Out of Control',
                   'Philadelphia Eagles vs. Miami Dolphins',
                   'Shes Back',
                   'Sister, Sister',
                   'Sky High',
                   'Sleeping Dogs',
                   'Strange Bedfellows',
                   'The Actor',
                   'The Bequest',
                   'The Lottery',
                   'The Running Man')
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
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('American National Studios, Hollywood, Los Angeles, California, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hong Kong, China',
                    'Las Vegas, Nevada, USA',
                    'Montréal, Québec, Canada',
                    'Stage 10, CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Stage 12, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 24, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 35, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Stage 4, Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Sydney, New South Wales, Australia',
                    'Tucson, Arizona, USA')
  AND mi2.info IN ('CAM:Panaflex Camera and Lenses by Panavision',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'LAB:DeLuxe, USA',
                    'LAB:Metrocolor',
                    'LAB:Technicolor, Hollywood (CA), USA',
                    'LAB:Technicolor, USA',
                    'OFM:16 mm',
                    'OFM:Video',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1');