WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('18')
   AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'CBS Studio 50, New York City, New York, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'London, England, UK',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'San Francisco, California, USA')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('2')
   AND mi2.info IN ('Black and White',
                    'Color')
   WHERE kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('director',
                   'miscellaneous crew')
  AND n.gender IS NULL;