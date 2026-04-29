
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND t.title IN ('(#1.30)',
                   '(#1.49)',
                   '(#1.57)',
                   '(#1.59)',
                   '(#2.21)',
                   '(#2.4)',
                   '(#5.18)',
                   '(#5.26)',
                   '(#8.5)',
                   'An Eye for an Eye',
                   'Another World',
                   'Bad Boy',
                   'Candida',
                   'Casanova Brown',
                   'Counterfeit',
                   'Die Fledermaus',
                   'Die Ratten',
                   'Ever Since Eve',
                   'Hobsons Choice',
                   'Holiday',
                   'Jeanne Eagels',
                   'La cieca di Sorrento',
                   'Nob Hill',
                   'Sahara',
                   'Test Pilot',
                   'The Payoff',
                   'The Rainmaker',
                   'The Winning Ticket',
                   'Too Many Cooks')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:Film Center, Mumbai, India',
                    'LAB:Rank Film Laboratories, Denham, UK',
                    'OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Panavision',
                    'RAT:2.20 : 1')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Jacksonville, Florida, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Santa Catalina Island, Channel Islands, California, USA',
                    'Stage 30, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Stage 4, Stage 1, Stage 1, NBC Studios - 3000 W. Alameda Avenue, Burbank, California, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'production designer',
                   'writer'));