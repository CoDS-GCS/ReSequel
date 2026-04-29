
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE rt.role IN ('actor',
                   'actress')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_cf IN ('A5362',
                           'B6261',
                           'H4236',
                           'O4252',
                           'P5235',
                           'P6252')
  AND t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode')
  AND mi1.info IN ('CBS Television City - 7800 Beverly Blvd., Fairfax, Los Angeles, California, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND it1.id IN ('18')
  AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Paramount Pictures')
  AND ct.kind IN ('distributors',
                   'production companies');