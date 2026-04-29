
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k,
     movie_companies AS mc,
     company_type AS ct,
     company_name AS cn
WHERE t.id = ci.movie_id
  AND t.id = mc.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mk.movie_id
  AND mc.company_type_id = ct.id
  AND mc.company_id = cn.id
  AND k.id = mk.keyword_id
  AND mi1.info_type_id = it1.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND it1.id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('D1316',
                           'E3632',
                           'G6262',
                           'H6163',
                           'J524',
                           'J525',
                           'M2416',
                           'M6352',
                           'R1631',
                           'R1632',
                           'R2636',
                           'W4362',
                           'W4525')
  AND t.production_year BETWEEN 1925 AND 2015
  AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'National Broadcasting Company (NBC)',
                   'Paramount Pictures',
                   'Universal TV',
                   'Warner Bros')
  AND ct.kind IN ('distributors',
                   'production companies');