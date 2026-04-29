WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND title IN ('(#1.263)',
                   '(#1.432)',
                   '(#1.944)',
                   'Die letzte Chance',
                   'Game 6',
                   'Honor Bound',
                   'Masterpiece',
                   'Palace',
                   'Running Scared',
                   'Special',
                   'Thats Entertainment',
                   'The Dating Game',
                   'The Suicide Club',
                   'The Threat')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('editor'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Austria',
                    'Canada',
                    'Czechoslovakia',
                    'Denmark',
                    'Hong Kong',
                    'Italy',
                    'Mexico',
                    'Philippines',
                    'Poland',
                    'Soviet Union',
                    'Switzerland',
                    'Yugoslavia')
  AND mi2.info IN ('Barcelona, Cataluña, Spain',
                    'Berlin, Germany',
                    'Buenos Aires, Federal District, Argentina',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'Munich, Bavaria, Germany',
                    'Paris, France',
                    'Philippines',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA');