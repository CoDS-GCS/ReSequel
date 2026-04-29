
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G')
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'miscellaneous crew')
  AND n.gender IN ('f',
                    'm')
  AND (n.name_pcode_nf IN ('A4163',
                           'A5242',
                           'B1614',
                           'C6231',
                           'J2423',
                           'J5252',
                           'M2425',
                           'R1631',
                           'R1632',
                           'R2631',
                           'R2632')
       OR n.name_pcode_nf IS NULL)
  AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)')
  AND ct.kind IN ('distributors',
                   'production companies');