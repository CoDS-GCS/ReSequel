 
 
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
  AND kt.kind IN ('episode',
                   'tv movie')
  AND rt.role IN ('composer',
                   'production designer')
  AND n.gender IN ('f',
                    'm')
  AND it1.id IN ('18')
  AND mi1.info IN ('Buenos Aires, Federal District, Argentina',
                    'CBS Studio 50, New York City, New York, USA',
                    'CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA')
  AND it2.id IN ('4')
  AND mi2.info IN ('English',
                    'Spanish');