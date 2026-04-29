
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
  AND rt.role IN ('composer')
  AND n.gender IN ('m')
  AND it1.id IN ('1')
  AND mi1.info IN ('100',
                    '16',
                    '17',
                    '18',
                    '25',
                    '30',
                    '60',
                    '88',
                    '95',
                    '96',
                    '98')
  AND it2.id IN ('3')
  AND mi2.info IN ('Animation',
                    'Comedy',
                    'Drama',
                    'Short');