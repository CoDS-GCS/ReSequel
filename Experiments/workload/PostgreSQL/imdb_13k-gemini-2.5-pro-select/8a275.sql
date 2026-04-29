
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1990 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PFM:35 mm',
                    'RAT:1.33 : 1')
AND mi1.info_type_id IN ('7')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)')
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6521',
                           'B6563',
                           'C6235',
                           'F6525',
                           'G6435',
                           'J5162',
                           'J5216',
                           'M4532',
                           'R1636',
                           'R215',
                           'R252',
                           'R2635');