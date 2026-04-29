
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
                   'video game',
                   'video movie')
  AND rt.role IN ('actress',
                   'production designer')
  AND n.gender IN ('m')
  AND it1.id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Short')
  AND it2.id IN ('1')
  AND mi2.info IN ('10',
                    '11',
                    '12',
                    '15',
                    '20',
                    '30',
                    '5',
                    '60',
                    '7',
                    '8',
                    '85',
                    '90',
                    'USA:20');