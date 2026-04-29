
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN movie_companies AS mc ON t.id = mc.movie_id
INNER JOIN company_type AS ct ON mc.company_type_id = ct.id
INNER JOIN company_name AS cn ON mc.company_id = cn.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN movie_keyword AS mk ON t.id = mk.movie_id
INNER JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Mono',
                    'Stereo')
  AND rt.role IN ('miscellaneous crew',
                   'writer')
  AND n.gender IS NULL
  AND (n.name_pcode_nf IN ('A5362',
                           'K6235',
                           'M6263',
                           'R1632',
                           'R2632')
       OR n.name_pcode_nf IS NULL)
  AND cn.name IN ('American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video')
  AND ct.kind IN ('distributors',
                   'production companies');