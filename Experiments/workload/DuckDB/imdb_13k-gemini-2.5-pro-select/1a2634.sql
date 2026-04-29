
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t,
        kind_type AS kt,
        info_type AS it1,
        movie_info AS mi1,
        movie_info AS mi2,
        info_type AS it2,
        cast_info AS ci,
        role_type AS rt,
        name AS n
   WHERE t.id = ci.movie_id
     AND t.id = mi1.movie_id
     AND t.id = mi2.movie_id
     AND mi1.info_type_id = it1.id
     AND mi2.info_type_id = it2.id
     AND t.kind_id = kt.id
     AND ci.person_id = n.id
     AND ci.role_id = rt.id
     AND it1.id IN ('18')
     AND it2.id IN ('17')
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
     AND mi2.info IN ('Last show of the series.',
                    'One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
     AND rt.role IN ('costume designer',
                   'director',
                   'guest',
                   'miscellaneous crew')
     AND n.gender IS NULL
     AND t.production_year BETWEEN 1875 AND 1975) AS subquery;