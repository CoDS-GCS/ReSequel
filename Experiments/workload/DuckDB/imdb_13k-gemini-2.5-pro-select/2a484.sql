
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
     movie_keyword AS mk
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND kt.kind IN ('tv movie',
                   'video game')
  AND rt.role IN ('composer',
                   'production designer')
  AND n.gender IN ('m')
  AND it1.id IN ('18')
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
  AND it2.id IN ('8')
  AND mi2.info IN ('Australia',
                    'France',
                    'Germany',
                    'Italy',
                    'USA');