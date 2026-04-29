
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode'))
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.33 : 1')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew'))
  AND n.gender IS NULL
  AND n.name_pcode_cf IN ('A3654',
                           'B4353',
                           'B6156',
                           'C6264',
                           'D4253',
                           'D4262',
                           'D4626',
                           'F6532',
                           'L1561',
                           'L5326',
                           'N2426',
                           'R2461',
                           'S5236')
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors',
                   'production companies'))
  AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)');