 
 
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
  AND t.production_year <= 1975
  AND t.production_year >= 1875
  AND kt.kind IN ('tv series',
                   'video game')
  AND rt.role IN ('composer',
                   'costume designer')
  AND n.gender IN ('m')
  AND it1.id IN ('18')
  AND mi1.info IN ('CBS Studio 50, New York City, New York, USA',
                    'Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('8')
  AND mi2.info IN ('Mexico',
                    'USA');