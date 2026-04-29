 
 
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
  AND it1.id IN ('8')
  AND it2.id IN ('18')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('Czechoslovakia',
                    'East Germany',
                    'Germany',
                    'India',
                    'Japan',
                    'Mexico',
                    'Philippines',
                    'Portugal',
                    'Soviet Union',
                    'Sweden',
                    'UK',
                    'USA',
                    'West Germany',
                    'Yugoslavia')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'CBS Studio 50, New York City, New York, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'New York City, New York, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1925 AND 1975;