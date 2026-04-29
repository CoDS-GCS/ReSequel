 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('18')
AND mi1.info IN ('ABC Television Center - 4151 Prospect Avenue, Los Angeles, California, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'London, England, UK',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'Mexico',
                    'Paris, France',
                    'Rome, Lazio, Italy',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Stage 22, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 28, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 9, 20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Studio 33, CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
AND mi2.info IN ('LAB:DeLuxe',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990;