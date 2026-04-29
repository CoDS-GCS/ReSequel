 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Almería, Andalucía, Spain',
                    'Berlin, Germany',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'RKO-Pathé Studios - 9336 Washington Blvd., Culver City, California, USA',
                    'San Diego, California, USA',
                    'Santa Monica, California, USA',
                    'Shepperton Studios, Shepperton, Surrey, England, UK',
                    'Stage 14, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 16, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 6, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Walt Disney Studios, 500 South Buena Vista Street, Burbank, California, USA')
  AND it2.id IN ('17')
  AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
  AND n.gender IS NULL
  AND rt.role IN ('costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew');