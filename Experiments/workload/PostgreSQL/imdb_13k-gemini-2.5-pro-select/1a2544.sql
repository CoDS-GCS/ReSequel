 
 
SELECT COUNT(*)
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
  AND it1.id IN ('4')
  AND it2.id IN ('18')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Bulgarian',
                    'Chinese',
                    'Croatian',
                    'Dutch',
                    'Finnish',
                    'Greek',
                    'Persian',
                    'Serbo-Croatian',
                    'Slovak',
                    'Slovenian',
                    'Telugu',
                    'Vietnamese')
  AND mi2.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'Bangkok, Thailand',
                    'Lisbon, Portugal',
                    'Long Beach, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Pasadena, California, USA',
                    'St. Petersburg, Russia',
                    'Stage 10, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 25, Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('composer',
                   'director',
                   'miscellaneous crew',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;