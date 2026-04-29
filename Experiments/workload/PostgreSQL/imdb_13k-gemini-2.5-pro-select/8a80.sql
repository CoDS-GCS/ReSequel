WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series')),
     filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('6')
     AND mi1.info IN ('Mono')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'composer',
                   'producer')
     AND n.gender IN ('m')
     AND n.surname_pcode IN ('B25',
                           'D1',
                           'H3',
                           'L235',
                           'L6',
                           'M45',
                           'M63',
                           'O165',
                           'O6',
                           'R2',
                           'S2',
                           'W256',
                           'W5')),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Granada Television',
                   'National Broadcasting Company (NBC)',
                   'Warner Bros. Television'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id;