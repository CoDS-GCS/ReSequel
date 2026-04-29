 
 
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'video game'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'production designer'))
  AND mi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('18'))
  AND mi1.info IN ('Berlin, Germany',
                    'Brooklyn, New York City, New York, USA',
                    'Dallas, Texas, USA',
                    'Las Vegas, Nevada, USA',
                    'Manhattan, New York City, New York, USA',
                    'Miami, Florida, USA',
                    'Munich, Bavaria, Germany',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'San Diego, California, USA',
                    'Santa Clarita, California, USA',
                    'Sydney, New South Wales, Australia',
                    'USA',
                    'Washington, District of Columbia, USA')
  AND mi2.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('8'))
  AND mi2.info IN ('Australia',
                    'France',
                    'Germany',
                    'Italy',
                    'USA');