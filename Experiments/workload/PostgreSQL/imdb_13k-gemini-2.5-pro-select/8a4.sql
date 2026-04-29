
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
AND n.name_pcode_cf IN ('A5362',
                           'B6261',
                           'H4236',
                           'O4252',
                           'P5235',
                           'P6252')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('OFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:16:9 HD')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('7')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1950 AND 1990;