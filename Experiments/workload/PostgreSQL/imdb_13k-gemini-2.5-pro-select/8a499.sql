
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1990 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Mono',
                    'Stereo')
AND mi1.info_type_id IN ('6')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video')
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A5362',
                           'C6424',
                           'E3241',
                           'E3632',
                           'F6526',
                           'G6252',
                           'J252',
                           'J5162',
                           'J524',
                           'M2423',
                           'M6252',
                           'M6352',
                           'R2636',
                           'V5253');