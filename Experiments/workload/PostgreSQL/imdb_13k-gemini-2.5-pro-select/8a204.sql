
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode')
  AND it1.id IN ('18')
  AND mi1.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'New York City, New York, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND rt.role IN ('actor',
                   'composer',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('C6423',
                           'C6426',
                           'D1316',
                           'D52',
                           'F6523',
                           'F6526',
                           'J2423',
                           'J5242',
                           'J5245',
                           'J5265',
                           'K5315',
                           'M2453',
                           'M6262',
                           'Z3625')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('ABS-CBN',
                   'British Broadcasting Corporation (BBC)',
                   'Granada Television',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video');