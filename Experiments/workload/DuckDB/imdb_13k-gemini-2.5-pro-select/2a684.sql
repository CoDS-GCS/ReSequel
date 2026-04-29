
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
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actress',
                   'writer')
  AND n.gender IN ('f',
                    'm')
  AND it1.id IN ('1')
  AND mi1.info IN ('10',
                    '102',
                    '30',
                    '60',
                    '70',
                    '85',
                    '86',
                    '90',
                    '92',
                    '96',
                    '99',
                    'USA:60')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'PFM:Video');