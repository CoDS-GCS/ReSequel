
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'tv series')) AS t
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('7')
     AND mi1.info IN ('RAT:1.33 : 1',
                    'RAT:1.78 : 1')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'miscellaneous crew')
     AND (n.gender IN ('f',
                    'm')
          OR n.gender IS NULL)
     AND n.surname_pcode IN ('A45',
                           'B65',
                           'C4',
                           'C65',
                           'F652',
                           'G6',
                           'H52',
                           'J52',
                           'L2',
                           'L5',
                           'L52',
                           'M24',
                           'P6',
                           'W3')) AS ci ON t.id = ci.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Warner Home Video')) AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;