
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1950 AND 1990
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('UK',
                    'USA')
AND mi1.info_type_id IN ('8')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video')
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4163',
                           'A5362',
                           'C6421',
                           'C6426',
                           'E3241',
                           'F6523',
                           'G6216',
                           'G6252',
                           'J5162',
                           'J5253',
                           'K3451',
                           'M4145',
                           'R1634',
                           'W4525');