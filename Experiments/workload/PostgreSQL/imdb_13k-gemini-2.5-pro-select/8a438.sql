
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.surname_pcode IN ('B4',
                           'H2',
                           'K5',
                           'R2',
                           'R5',
                           'S5',
                           'S53',
                           'W42',
                           'W5')
       OR n.surname_pcode IS NULL)
  AND rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode')
  AND it1.id IN ('1')
  AND mi1.info IN ('USA:30',
                    'USA:60')
  AND ct.kind IN ('distributors',
                   'production companies')
  AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Pathé Frères',
                   'Universal Pictures');