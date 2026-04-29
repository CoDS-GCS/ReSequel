
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
  AND it1.id IN ('1')
  AND it2.id IN ('8')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('65',
                    '77',
                    '85',
                    'Canada:30',
                    'UK:10',
                    'UK:60',
                    'USA:101',
                    'USA:93')
  AND mi2.info IN ('Australia',
                    'Brazil',
                    'Cuba',
                    'Greece',
                    'Iran',
                    'New Zealand',
                    'Norway',
                    'Sweden',
                    'Venezuela',
                    'Yugoslavia')
  AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie')
  AND rt.role IN ('cinematographer',
                   'guest')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;