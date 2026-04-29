
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND kt.kind IN ('episode')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video')
  AND it1.id IN ('1')
  AND mi1.info IN ('30',
                    '60')
  AND rt.role IN ('actress',
                   'miscellaneous crew')
  AND n.gender IN ('f')
  AND (n.surname_pcode IN ('B42',
                           'B62',
                           'F652',
                           'H2',
                           'H4',
                           'J52',
                           'L',
                           'M6',
                           'R2',
                           'S53')
       OR n.surname_pcode IS NULL);