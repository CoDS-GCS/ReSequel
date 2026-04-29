WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year >= 1975
     AND t.production_year <= 2015
     AND kt.kind IN ('episode')
     AND it1.id IN ('1')
     AND mi1.info IN ('60')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('A1431',
                           'A5242',
                           'E4213',
                           'F6521',
                           'I6532',
                           'J5352',
                           'M6153',
                           'N5253',
                           'R252',
                           'R5636')
          OR n.name_pcode_nf IS NULL)),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('ABS-CBN',
                   'Fox Network',
                   'Granada Television',
                   'Sony Pictures Home Entertainment',
                   'Warner Bros. Television'))
SELECT COUNT(*)
FROM filtered_t_mi AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;