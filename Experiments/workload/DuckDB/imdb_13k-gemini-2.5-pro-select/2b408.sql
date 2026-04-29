
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'RAT:1.85 : 1')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('aeronautical-technology',
                     'all-day-sucker',
                     'apartment-search',
                     'double-cross',
                     'gun-in-vagina',
                     'hot-water-sprayed-into-eyes',
                     'public-execution',
                     'self-inject',
                     'stolen-gold',
                     'supernatural-battle'));