
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Mono',
                    'Stereo')
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND n.surname_pcode IN ('A45',
                           'B42',
                           'B452',
                           'C16',
                           'C452',
                           'C636',
                           'C64',
                           'G635',
                           'P412',
                           'P6',
                           'R',
                           'R24',
                           'W426')
  AND ct.kind IN ('distributors')
  AND cn.name IN ('American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video');