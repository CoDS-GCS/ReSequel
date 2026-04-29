WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie',
                   'tv movie')),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('3')
     AND mi1.info IN ('Comedy')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'writer')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND n.surname_pcode IN ('B2',
                           'B6',
                           'B62',
                           'C2',
                           'C5',
                           'G6',
                           'J52',
                           'J525',
                           'L',
                           'L15',
                           'L52',
                           'M62',
                           'P62',
                           'S5')),
     mc_filtered AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors')
     AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN mc_filtered AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;