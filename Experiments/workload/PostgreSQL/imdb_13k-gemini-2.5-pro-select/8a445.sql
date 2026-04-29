
SELECT COUNT(*)
FROM
  (SELECT ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND n.name_pcode_nf IN ('B1626',
                           'C6231',
                           'C6421',
                           'D5162',
                           'E4213',
                           'J52',
                           'J5216',
                           'J525',
                           'J5262',
                           'M6263',
                           'R1635',
                           'R2631',
                           'S3152')
     AND rt.role IN ('actor',
                   'actress')) AS fc
JOIN title AS t ON fc.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Fox Network',
                   'Independent Television (ITV)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'National Broadcasting Company (NBC)',
                   'Paramount Pictures',
                   'Shout! Factory',
                   'Warner Bros')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('UK')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('8')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;