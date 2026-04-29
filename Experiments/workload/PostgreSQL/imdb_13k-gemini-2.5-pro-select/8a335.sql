
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'tv series')
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama')
AND mi1.info_type_id IN ('3')
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN name AS n ON ci.person_id = n.id
AND n.gender IS NULL
AND n.name_pcode_cf IN ('A2365',
                           'A6252',
                           'D2362',
                           'E1524',
                           'E2163',
                           'L1214',
                           'L2',
                           'P5215',
                           'P6235',
                           'Q5325',
                           'R3626',
                           'V4524')
INNER JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'editor',
                   'miscellaneous crew')
INNER JOIN movie_keyword AS mk ON t.id = mk.movie_id
INNER JOIN movie_companies AS mc ON t.id = mc.movie_id
INNER JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)')
INNER JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
WHERE t.production_year BETWEEN 1990 AND 2015;