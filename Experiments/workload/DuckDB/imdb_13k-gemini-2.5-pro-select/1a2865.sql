
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
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('105',
                    '13',
                    '58',
                    '67',
                    '74',
                    '84',
                    '95',
                    'USA:10')
  AND it2.id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Berlin, Germany',
                    'CBS Studio 50, New York City, New York, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Paris, France',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND rt.role IN ('composer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);