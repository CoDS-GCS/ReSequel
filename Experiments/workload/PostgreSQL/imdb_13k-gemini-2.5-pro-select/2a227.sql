 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'cinematographer')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('4')
AND mi1.info IN ('English',
                    'Spanish')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('18')
AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Mexico City, Distrito Federal, Mexico',
                    'Pinewood Studios, Iver Heath, Buckinghamshire, England, UK',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 3, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975;