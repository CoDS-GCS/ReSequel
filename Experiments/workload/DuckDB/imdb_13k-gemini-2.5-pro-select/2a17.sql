
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
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('director')
  AND n.gender IN ('f')
  AND it1.id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Mexico',
                    'Spain',
                    'USA')
  AND it2.id IN ('18')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Mexico',
                    'New York City, New York, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA');