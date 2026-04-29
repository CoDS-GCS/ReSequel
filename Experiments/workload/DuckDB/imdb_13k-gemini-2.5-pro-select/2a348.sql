
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE t.production_year <= 2015
  AND t.production_year >= 1975
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND t.kind_id = kt.id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND it1.id IN ('18')
  AND mi1.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Metromedia Square - 5746 W. Sunset Blvd., Hollywood, Los Angeles, California, USA',
                    'New York City, New York, USA')
  AND mi2.info_type_id = it2.id
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1')
  AND ci.role_id = rt.id
  AND rt.role IN ('director',
                   'production designer')
  AND ci.person_id = n.id
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND mk.keyword_id = k.id
  AND mi1.movie_id = mi2.movie_id;