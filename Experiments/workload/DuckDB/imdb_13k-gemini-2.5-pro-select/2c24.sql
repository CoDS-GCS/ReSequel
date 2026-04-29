
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.38)',
                   '(#2.23)',
                   '(#4.8)',
                   '(#6.8)',
                   '(#7.7)',
                   '(#8.2)',
                   'A Matter of Honor',
                   'Antigone',
                   'Arena',
                   'Assault',
                   'Blind Date',
                   'Breakthrough',
                   'Buried Treasure',
                   'Der Maulkorb',
                   'Follow the Boys',
                   'It Started with Eve',
                   'Kismet',
                   'Lady in the Dark',
                   'Last Chance',
                   'Million Dollar Baby',
                   'Missing',
                   'Pinocchio',
                   'Quo Vadis',
                   'Sesame Street',
                   'Sweet Rosie OGrady',
                   'The Dinner Party',
                   'The Legacy',
                   'The Phantom of the Opera',
                   'The Proposal',
                   'The Sacrifice',
                   'The Secret',
                   'The Silent Witness',
                   'The Target',
                   'With a Song in My Heart')
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Australia',
                    'Austria',
                    'Canada',
                    'Czechoslovakia',
                    'East Germany',
                    'France',
                    'Germany',
                    'Hong Kong',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Spain',
                    'Sweden',
                    'USA',
                    'West Germany')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'writer'));