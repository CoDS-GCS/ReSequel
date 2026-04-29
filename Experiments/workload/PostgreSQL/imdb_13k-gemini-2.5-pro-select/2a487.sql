 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv series',
                   'video movie')
     AND t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IS NULL
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('writer')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('18')
AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Buenos Aires, Federal District, Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'General Service Studios - 1040 N. Las Palmas, Hollywood, Los Angeles, California, USA',
                    'Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('2')
AND mi2.info IN ('Black and White',
                    'Color');