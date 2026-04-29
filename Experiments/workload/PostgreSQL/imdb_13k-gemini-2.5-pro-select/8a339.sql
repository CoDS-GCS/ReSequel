
SELECT COUNT(*)
FROM name AS n
INNER JOIN cast_info AS ci ON n.id = ci.person_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
INNER JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 2015
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series')
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Black and White',
                    'Color')
AND mi1.info_type_id IN ('2')
INNER JOIN movie_keyword AS mk ON t.id = mk.movie_id
INNER JOIN movie_companies AS mc ON t.id = mc.movie_id
INNER JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('20th Century Fox Television',
                   'ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Granada Television',
                   'National Broadcasting Company (NBC)',
                   'Warner Bros. Television',
                   'Warner Home Video')
INNER JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
WHERE n.gender IS NULL
  AND n.name_pcode_cf IN ('A2365',
                           'B5242',
                           'D1614',
                           'E1524',
                           'L1214',
                           'L2',
                           'P3625',
                           'P5215',
                           'Q5325',
                           'R2425',
                           'R25',
                           'R3626',
                           'S3152',
                           'S5325',
                           'T5212');