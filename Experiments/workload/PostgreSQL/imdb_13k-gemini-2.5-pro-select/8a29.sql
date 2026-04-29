
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('8')
  AND mi1.info IN ('UK',
                    'USA')
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A4163',
                           'A4523',
                           'J2165',
                           'J252',
                           'J5252',
                           'K3652',
                           'M6215',
                           'R1632',
                           'R1634',
                           'R5345')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)');