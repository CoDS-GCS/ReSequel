 
 
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
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND k.id = mk.keyword_id
  AND mi1.movie_id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND (it1.id IN ('6'))
  AND (it2.id IN ('18'))
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (mi1.info IN ('Dolby Digital',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo'))
  AND (mi2.info IN ('Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Vancouver, British Columbia, Canada',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA'))
  AND (kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND (rt.role IN ('producer'))
  AND (n.gender IS NULL)
  AND (t.production_year <= 2015)
  AND (t.production_year >= 1975);