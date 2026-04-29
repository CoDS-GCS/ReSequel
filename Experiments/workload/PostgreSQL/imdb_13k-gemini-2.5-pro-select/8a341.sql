WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode')),
     filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('1')
     AND mi1.info IN ('60')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'actress')
     AND n.gender IN ('f',
                    'm')
     AND n.surname_pcode IN ('D25',
                           'G4',
                           'G62',
                           'M25',
                           'M35',
                           'M635',
                           'M642',
                           'P2',
                           'R16',
                           'S53')),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('ABS-CBN',
                   'Fox Network',
                   'Sony Pictures Home Entertainment',
                   'Warner Bros. Television'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id;