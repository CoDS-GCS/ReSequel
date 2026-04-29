 
 
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
  AND t.production_year >= 1925
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('production designer')
  AND n.gender IN ('m')
  AND it1.id IN ('4')
  AND mi1.info IN ('English')
  AND it2.id IN ('16')
  AND mi2.info IN ('USA:2002',
                    'USA:2004',
                    'USA:2006',
                    'USA:2008',
                    'USA:2009',
                    'USA:2013');