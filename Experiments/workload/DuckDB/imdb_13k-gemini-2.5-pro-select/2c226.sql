WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.466)',
                   '(#1.641)',
                   'Adventures in Babysitting',
                   'Aftershock',
                   'Divorce',
                   'Exposure',
                   'I Do, I Do',
                   'Key to the City',
                   'Le malade imaginaire',
                   'Midnight Lace',
                   'No More Mr. Nice Guy',
                   'Runners',
                   'Short Circuit',
                   'The Bracelet',
                   'Wild at Heart')
     AND kt.kind IN ('episode',
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
WHERE n.gender IN ('m')
  AND rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'production designer')
  AND it1.id IN ('18')
  AND mi1.info IN ('Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Chicago, Illinois, USA',
                    'England, UK',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Montréal, Québec, Canada',
                    'New York City, New York, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Sydney, New South Wales, Australia',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('8')
  AND mi2.info IN ('Australia',
                    'Austria',
                    'Belgium',
                    'East Germany',
                    'France',
                    'Mexico',
                    'Netherlands',
                    'Spain',
                    'USA');