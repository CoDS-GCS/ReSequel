WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'director')
     AND n.gender IN ('f',
                    'm')
     AND n.surname_pcode IN ('A436',
                           'B2',
                           'B452',
                           'C16',
                           'C462',
                           'C65',
                           'H2',
                           'J52',
                           'L2',
                           'M5',
                           'R2',
                           'S23',
                           'W425')),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id;