 
 
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
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('director',
                   'miscellaneous crew')
  AND n.gender IN ('f',
                    'm')
  AND it1.id IN ('4')
  AND mi1.info IN ('English',
                    'Spanish')
  AND it2.id IN ('1')
  AND mi2.info IN ('105',
                    '15',
                    '26',
                    '85',
                    '88',
                    'USA:25');