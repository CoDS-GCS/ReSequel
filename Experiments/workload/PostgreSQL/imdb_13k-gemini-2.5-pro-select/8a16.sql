WITH ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actress',
                   'miscellaneous crew')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.surname_pcode IN ('B2',
                           'B4',
                           'B42',
                           'B62',
                           'C2',
                           'C5',
                           'J525',
                           'L2',
                           'L5')),
     mc_filtered AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN mc_filtered AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 1975
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Mono',
                    'SDDS',
                    'Stereo');