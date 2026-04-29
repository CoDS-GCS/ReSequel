WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('6')
     AND mi1.info IN ('Mono',
                    'Silent',
                    'Stereo')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'miscellaneous crew')
     AND n.gender IN ('m')
     AND n.surname_pcode IN ('B26',
                           'B62',
                           'B653',
                           'C16',
                           'C62',
                           'G635',
                           'H65',
                           'K5',
                           'M263',
                           'O165',
                           'P6',
                           'S')),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors')
     AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'General Film Company',
                   'National Broadcasting Company (NBC)',
                   'Pathé Frères'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id;